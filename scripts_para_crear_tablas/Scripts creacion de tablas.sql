
---------------  CREACI�N BASE DE DATOS ------------------------

CREATE DATABASE PERMISOS

USE PERMISOS

----------------	CREACION TABLAS  ----------------------------

CREATE TABLE [User] (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL
);

CREATE TABLE [Role] (
    RoleId INT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL
);

CREATE TABLE UserRole (
    UserRoleId INT PRIMARY KEY,
    UserId INT,
    RoleId INT,
    FOREIGN KEY (UserId) REFERENCES [User](UserId),
    FOREIGN KEY (RoleId) REFERENCES [Role](RoleId)
);

CREATE TABLE Entity (
    EntityId INT PRIMARY KEY,
    EntityName VARCHAR(50) NOT NULL
);

CREATE TABLE Record (
    RecordId INT PRIMARY KEY,
    EntityId INT,                  
    RecordName VARCHAR(50) NOT NULL,
    FOREIGN KEY (EntityId) REFERENCES Entity(EntityId)
);

CREATE TABLE PermiUser (
    PermiUserId INT PRIMARY KEY,
    UserId INT,              
    PermissionId INT         
	FOREIGN KEY (UserId) REFERENCES [User](UserId),
    FOREIGN KEY (PermissionId) REFERENCES Permission(PermissionId)
);

CREATE TABLE PermiRole (
    PermiRoleId INT PRIMARY KEY,
    RoleId INT,              
    PermissionId INT         
	FOREIGN KEY (RoleId) REFERENCES [Role](RoleId),
    FOREIGN KEY (PermissionId) REFERENCES Permission(PermissionId)
);

CREATE TABLE PermiUserRecord (
    PermiUserRecordId INT PRIMARY KEY,
    UserId INT,              
    EntityId INT,            
    RecordId INT,            
    PermissionId INT         
	FOREIGN KEY (UserId) REFERENCES [User](UserId),
	FOREIGN KEY (EntityId) REFERENCES Entity(EntityId),
	FOREIGN KEY (RecordId) REFERENCES Record(RecordId),
	FOREIGN KEY (PermissionId) REFERENCES Permission(PermissionId)
);

CREATE TABLE PermiRoleRecord (
    PermiRoleRecordId INT PRIMARY KEY,
    RoleId INT,              
    EntityId INT,            
    RecordId INT,            
    PermissionId INT
	FOREIGN KEY (RoleId) REFERENCES [Role](RoleId),
	FOREIGN KEY (EntityId) REFERENCES Entity(EntityId),
	FOREIGN KEY (RecordId) REFERENCES Record(RecordId),
	FOREIGN KEY (PermissionId) REFERENCES Permission(PermissionId)
);

CREATE TABLE Permission (
    PermissionId INT PRIMARY KEY,
    PermissionName VARCHAR(50)
);



-------------- INSERCION EN TABLAS  ----------------------------

---- USUARIOS
SELECT * FROM [USER]

	INSERT INTO [User] (UserId, UserName) VALUES (1, 'Alejandro Gomez');
	INSERT INTO [User] (UserId, UserName) VALUES (2, 'Diana Franco');
	INSERT INTO [User] (UserId, UserName) VALUES (3, 'Andres Ramirez');
	INSERT INTO [User] (UserId, UserName) VALUES (4, 'Daniel Trivino');
	INSERT INTO [User] (UserId, UserName) VALUES (5, 'Marylin Contreras');
	INSERT INTO [User] (UserId, UserName) VALUES (6, 'Edgar Barriga');
	INSERT INTO [User] (UserId, UserName) VALUES (7, 'Diana Blanco');
	INSERT INTO [User] (UserId, UserName) VALUES (8, 'Sandra Matiz');
	INSERT INTO [User] (UserId, UserName) VALUES (9, 'Martha Jimenez');
	INSERT INTO [User] (UserId, UserName) VALUES (10, 'Oliver Lopez');
	INSERT INTO [User] (UserId, UserName) VALUES (11, 'Paola Vivas');
	INSERT INTO [User] (UserId, UserName) VALUES (12, 'Lorena Rico');
	INSERT INTO [User] (UserId, UserName) VALUES (13, 'Andres Perez');
	INSERT INTO [User] (UserId, UserName) VALUES (14, 'Stefania Rodriguez');
	INSERT INTO [User] (UserId, UserName) VALUES (15, 'Fanny Gutierrez');
	INSERT INTO [User] (UserId, UserName) VALUES (16, 'Martha Galindo');
	INSERT INTO [User] (UserId, UserName) VALUES (17, 'Carolina Vargas');
	INSERT INTO [User] (UserId, UserName) VALUES (18, 'Julian Otalora');
	INSERT INTO [User] (UserId, UserName) VALUES (19, 'Indira Bravo');
	INSERT INTO [User] (UserId, UserName) VALUES (20, 'Juan Carlos Rodriguez');
	INSERT INTO [User] (UserId, UserName) VALUES (21, 'Jhoana Arbelaez');
	INSERT INTO [User] (UserId, UserName) VALUES (22, 'Deivid Rios');
	INSERT INTO [User] (UserId, UserName) VALUES (23, 'Sandra Villamil ');
	INSERT INTO [User] (UserId, UserName) VALUES (24, 'Tatiana Rojas');
	INSERT INTO [User] (UserId, UserName) VALUES (25, 'Natalia Benjumea');
	INSERT INTO [User] (UserId, UserName) VALUES (26, 'Sebastian Monroy');
	INSERT INTO [User] (UserId, UserName) VALUES (27, 'Lorena Zapata');
	INSERT INTO [User] (UserId, UserName) VALUES (28, 'Michelle Riquelme');
	INSERT INTO [User] (UserId, UserName) VALUES (29, 'Jose Andres Celi');
	INSERT INTO [User] (UserId, UserName) VALUES (30, 'Zuli Vergara');
	INSERT INTO [User] (UserId, UserName) VALUES (31, 'Ricardo Perez');
	INSERT INTO [User] (UserId, UserName) VALUES (32, 'Laura Benjumea');


---- ROLE
SELECT * FROM [Role]

	INSERT INTO [Role] (RoleId, RoleName) VALUES (1, 'Gerente');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (2, 'Director Operativo');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (3, 'Ejecutivo Comercial');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (4, 'SubDirector');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (5, 'Asesor Comercial');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (6, 'Cajero');
	INSERT INTO [Role] (RoleId, RoleName) VALUES (7, 'Auditor');


--- ENTIDAD
SELECT * FROM Entity

	INSERT INTO Entity (EntityId, EntityName) VALUES (1, 'Sucursal');
	INSERT INTO Entity (EntityId, EntityName) VALUES (2, 'Centro de Costos');


-- DEALLE SUCURSAL Y/O CENTRO DE COSTO
SELECT * FROM Record

	-- Registros para Sucursal
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (101, 1, 'Sucursal Centro');
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (102, 1, 'Sucursal Norte');
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (103, 1, 'Sucursal Occidente');
	-- Registros para Centros de Costos
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (201, 2, 'Centro de Costos Operativo');
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (202, 2, 'Centro de Costos Comercial');
	INSERT INTO Record (RecordId, EntityId, RecordName) VALUES (203, 2, 'Centro de Costos Financiero');


--- ROL POR USUARIO
SELECT * FROM UserRole

	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (1, 1, 1); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (2, 2, 2); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (3, 3, 3); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (4, 4, 7); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (5, 5, 5); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (6, 6, 6); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (7, 7, 4); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (8, 8, 3); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (9, 9, 7); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (10, 10, 5); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (11, 11, 6); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (12, 12, 1); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (13, 13, 2); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (14, 14, 4); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (15, 15, 6); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (16, 16, 7); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (17, 17, 1); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (18, 18, 2); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (19, 19, 3); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (20, 20, 4); 
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (21, 21, 5);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (22, 22, 6);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (23, 23, 6);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (24, 24, 6);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (25, 25, 5);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (26, 26, 5);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (27, 27, 5);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (28, 28, 3);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (29, 29, 3);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (30, 30, 3);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (31, 31, 6);
	INSERT INTO UserRole (UserRoleId, UserId, RoleId) VALUES (32, 32, 5);


---- PERMISOS
SELECT * FROM Permission

	INSERT INTO Permission (PermissionId, PermissionName) VALUES (1, 'Crear');
	INSERT INTO Permission (PermissionId, PermissionName) VALUES (2, 'Leer');
	INSERT INTO Permission (PermissionId, PermissionName) VALUES (3, 'Actualizar');
	INSERT INTO Permission (PermissionId, PermissionName) VALUES (4, 'Borrar');


---- PERMISOS POR USUARIOS
SELECT * FROM PermiUser

	--- EJECUTIVOS
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (1, 3, 4)
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (2, 8, 4)
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (3, 19,4);
	
	--- ASESORES COMERCIALES
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (4,5,3);
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (5,10,3);
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (6,21,3);
		
	--- CAJEROS
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (7,6,1);
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (8,11,1);
	INSERT INTO PermiUser (PermiUserId, UserId, PermissionId) VALUES (9,15,1);


---- PERMISOS POR ROLES:
SELECT * FROM PermiRole
	
	--- GERENTE
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (1, 1,1);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (2, 1,2);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (3, 1,3);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (4, 1,4);
	
	--- DIRECTOR OPERATIVO
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (5, 2,1);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (6, 2,2);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (7, 2,3);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (8, 2,4);
	
	--- EJECUTIVO COMERCIAL
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (9, 3,1);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (10,3,2);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (11,3,3);
	
	--- SUBDIRECTOR
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (12,4,1);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (13,4,2);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (14,4,3);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (15,4,4);
	
	--- ASESOR COMERCIAL
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (16,5,1);
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (17,5,2);
	
	--- CAJERO
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (18,6,2);
	
	--- AUDITOR
	INSERT INTO PermiRole (PermiRoleId, RoleId, PermissionId) VALUES (19,7,2);


----- PERMISOS A CENTROS DE COSTOS PARA AUDITORES
SELECT * FROM PermiRoleRecord 

	INSERT INTO PermiRoleRecord (PermiRoleRecordId, RoleId, EntityId, RecordId, PermissionId)VALUES (1, 7, 2, 201, 2);
	INSERT INTO PermiRoleRecord (PermiRoleRecordId, RoleId, EntityId, RecordId, PermissionId)VALUES (2, 7, 2, 202, 2);
	INSERT INTO PermiRoleRecord (PermiRoleRecordId, RoleId, EntityId, RecordId, PermissionId)VALUES (3, 7, 2, 203, 2);


----- PERMISOS PARA USUARIOS EN SUCURSALES
SELECT * FROM PermiUserRecord 

	---- ASESOR SUPERNUMERARIO
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (1, 25, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (2, 25, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (3, 25, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (4, 25, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (5, 25, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (6, 25, 1, 103, 2);

	--- CAJERO SUPERNUMERARIO
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (7, 31, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (8, 31, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (9, 31, 1, 103, 2);

	--- EJECUTIVOS CON PERMISOS ESPECIALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (10, 3, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (11, 3, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (12, 3, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (13, 3, 1, 101, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (14, 8, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (15, 8, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (16, 8, 1, 102, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (17, 8, 1, 102, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (18, 19, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (19, 19, 1, 103, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (20, 19, 1, 103, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (21, 19, 1, 103, 4);

	--- ASESORES CON PERMISOS ESPECIALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (22, 10, 1, 101, 1); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (23, 10, 1, 101, 2); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (24, 10, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (25, 5, 1, 102, 1); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (26, 5, 1, 102, 2); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (27, 5, 1, 102, 3); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (28, 21, 1, 103, 1); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (29, 21, 1, 103, 2); 
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (30, 21, 1, 103, 3);

	--- ASESORES CON PERMISOS ESPECIALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (31, 11, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (32, 11, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (33, 15, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (34, 15, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (35, 6, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (36, 6, 1, 103, 2);

	--- GERENTES EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (37, 1, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (38, 1, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (39, 1, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (40, 1, 1, 101, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (41, 12, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (42, 12, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (43, 12, 1, 102, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (44, 12, 1, 102, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (45, 17, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (46, 17, 1, 103, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (47, 17, 1, 103, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (48, 17, 1, 103, 4);

	--- DIRECTORES OPERATIVOS EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (49, 2, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (50, 2, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (51, 2, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (52, 2, 1, 101, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (53, 13, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (54, 13, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (55, 13, 1, 102, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (56, 13, 1, 102, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (57, 18, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (58, 18, 1, 103, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (59, 18, 1, 103, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (60, 18, 1, 103, 4);

	---- EJECUTIVOS EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (61, 28, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (62, 28, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (63, 28, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (64, 29, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (65, 29, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (66, 29, 1, 102, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (67, 30, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (68, 30, 1, 103, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (69, 30, 1, 103, 3);

	---- SUBDIRECTORES EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (70, 7, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (71, 7, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (72, 7, 1, 101, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (73, 7, 1, 101, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (74, 14, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (75, 14, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (76, 14, 1, 102, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (77, 14, 1, 102, 4);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (78, 20, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (79, 20, 1, 103, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (80, 20, 1, 103, 3);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (81, 20, 1, 103, 4);

	---- ASESORES EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (82, 27, 1, 101, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (83, 27, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (84, 32, 1, 102, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (85, 32, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (86, 26, 1, 103, 1);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (87, 26, 1, 103, 2);

	---- CAJEROS EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (88, 22, 1, 101, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (89, 24, 1, 102, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (90, 23, 1, 103, 2);

	---- AUDITORES EN SUCURSALES
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (91, 4, 2, 201, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (92, 4, 2, 202, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (93, 4, 2, 203, 2);	
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (94, 9, 2, 201, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (95, 9, 2, 202, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (96, 9, 2, 203, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (97, 16, 2, 201, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (98, 16, 2, 202, 2);
	INSERT INTO PermiUserRecord (PermiUserRecordId, UserId, EntityId, RecordId, PermissionId)VALUES (99, 16, 2, 203, 2);
	

	-----------------------------------  QUERYS  ----------------------------------------------------  

exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 3  -- Ejecutivo Comercial con Privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 8  -- Ejecutivo Comercial con Privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 19 -- Ejecutivo Comercial con Privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 5  -- Asesor Comercial con privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 10 -- Asesor Comercial con privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 21 -- Asesor Comercial con privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 6  -- Cajero con privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 11 -- Cajero con privilegios
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 15 -- Cajero con privilegios

exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 25 -- Asesor Comercial Supernumerario varias sucursales 
exec sp_ObtenerPermisosUsuarios @EntityId = 1, @UserId = 31 -- Cajero Supernumerario varias sucursales

exec sp_ObtenerPermisosUsuarios @EntityId = 2, @UserId = 4 --  Auditores Centros de Costos
exec sp_ObtenerPermisosUsuarios @EntityId = 2, @UserId = 9 --  Auditores Centros de Costos
exec sp_ObtenerPermisosUsuarios @EntityId = 2, @UserId = 16 -- Auditores Centros de Costos

SELECT * FROM [User] 
SELECT * FROM [Role]
SELECT * FROM UserRole
SELECT * FROM PermiUser
SELECT * FROM PermiRole
SELECT * FROM PermiUserRecord
SELECT * FROM PermiRoleRecord
SELECT * FROM Entity
SELECT * FROM Record
select * from Permission

---Tabla User � Representa a los empleados del banco
SELECT * FROM [User]

--- Tabla Role � Representa roles dentro del banco
SELECT * FROM [Role]

--- Tabla Entity � Representa entidades como Sucursales o Centros de Costos
SELECT * FROM Entity

--- Tabla Record � Registros espec�ficos de cada entidad, como sucursales o centros de costos espec�ficos
SELECT * FROM Record

---Tabla UserRole --- Registro de Roles por usuario
SELECT UserName,RoleName
FROM UserRole UR
JOIN [User] U ON U.UserId = UR.UserId
JOIN [Role] R ON R.RoleId = UR.RoleId

--- Tabla Permission � Definici�n de permisos b�sicos en el sistema
SELECT * FROM Permission

--- Tabla PermiRole � Permisos asignados a roles, aplicando a cualquier usuario con ese rol
SELECT  R.RoleName,P.PermissionName  
FROM PermiRole PR
JOIN [Role] R ON R.RoleId = PR.RoleId
JOIN Permission P ON P.PermissionId = PR.PermissionId

--- Tabla PermiUser � Permisos asignados directamente a usuarios
SELECT PU.PermiUserId,U.UserName,R.RoleName,P.PermissionName
FROM PermiUser PU
JOIN [User] U ON U.UserId = PU.UserId
JOIN Permission P ON P.PermissionId = PU.PermissionId
JOIN UserRole UR ON UR.UserId = U.UserId
JOIN [Role] R ON UR.RoleId = R.RoleId

--- Tabla PermiRoleRecord � Permisos espec�ficos asignados a un rol sobre un registro particular
SELECT U.UserName,R.RoleName,E.EntityName,RE.RecordName,P.PermissionName
FROM PermiRoleRecord PRR
JOIN UserRole UR ON UR.RoleId = PRR.RoleId
JOIN [ROLE] R ON R.RoleId = UR.RoleId
join [User] U ON U.UserId = UR.UserId
JOIN Entity E ON E.EntityId = PRR.EntityId
JOIN Record RE ON RE.RecordId = PRR.RecordId
JOIN Permission P ON P.PermissionId = PRR.PermissionId

--- Tabla PermiUserRecord � permisos de usuarios en sucursales
SELECT U.UserName,R.RoleName,E.EntityName,RE.RecordName,P.PermissionName
FROM PermiUserRecord PUR
JOIN UserRole UR ON UR.UserId = PUR.UserId
JOIN [ROLE] R ON R.RoleId = UR.RoleId
join [User] U ON U.UserId = UR.UserId
JOIN Entity E ON E.EntityId = PUR.EntityId
JOIN Record RE ON RE.RecordId = PUR.RecordId
JOIN Permission P ON P.PermissionId = PUR.PermissionId
order by 4 desc

