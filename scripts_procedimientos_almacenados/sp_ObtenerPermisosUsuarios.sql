USE [BD PERMISOS]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPermisosUsuarios]    Script Date: 05/11/2024 23:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_ObtenerPermisosUsuarios]
 @EntityId INT,
 @UserId INT
AS
BEGIN
    -- Tabla temporal para almacenar permisos finales
    CREATE TABLE #UserPermissions (
        nombreUsuario NVARCHAR(50),
        RolUsuario NVARCHAR(50),
        PermissionName NVARCHAR(50),
        Level NVARCHAR(100)
    );

    -- Permisos a nivel de registro asignados al usuario
    INSERT INTO #UserPermissions (nombreUsuario, RolUsuario, PermissionName, Level)
	SELECT U.UserName, R.RoleName, p.PermissionName, 'Permisos solo para la ' + suc.EntityName + ' solo en ' + cc.RecordName
    FROM PermiUserRecord pur
    JOIN UserRole UR ON UR.UserId = pur.UserId
    JOIN [ROLE] R ON R.RoleId = UR.RoleId
    JOIN [User] U ON U.UserId = UR.UserId
	JOIN SUCURSAL SUC ON suc.EntityId = pur.EntityId
    JOIN Permission p ON pur.PermissionId = p.PermissionId
	join PermiRoleRecord prr on prr.RecordId = pur.RecordId
	join CentroCosto cc on cc.RecordId = prr.RecordId
    WHERE pur.UserId = @UserId
      AND pur.EntityId = @EntityId;

    -- Permisos a nivel de entidad asignados directamente al usuario
    INSERT INTO #UserPermissions (nombreUsuario, RolUsuario, PermissionName, Level)
    SELECT U.UserName, R.RoleName, p.PermissionName, 'Permiso asignado a usuario por contingencia'
    FROM PermiUser pu
    JOIN [User] U ON U.UserId = pu.UserId
    JOIN UserRole UR ON UR.UserId = U.UserId
    JOIN [Role] R ON UR.RoleId = R.RoleId
    JOIN Permission p ON pu.PermissionId = p.PermissionId
    WHERE pu.UserId = @UserId;

    -- subconsulta para aplicar DISTINCT y ordenar los resultados
    SELECT *
    FROM (
        SELECT DISTINCT nombreUsuario, RolUsuario, PermissionName, Level
        FROM #UserPermissions
    ) AS DistinctPermissions
    ORDER BY 
        CASE 
            WHEN Level = 'Permiso asignado a usuario por contingencia' THEN 0 
            ELSE 1 
        END,
        PermissionName; -- Orden secundario

    -- Limpia la tabla temporal
    DROP TABLE #UserPermissions;
END;