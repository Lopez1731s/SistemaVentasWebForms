/*SELECCIONAR CARGOS*/
IF OBJECT_ID('SeleccionarCargos') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.SeleccionarCargos
END
GO
CREATE PROCEDURE dbo.SeleccionarCargos
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	SELECT idCargo, nombreCargo, salarioCargo
	FROM dbo.Cargo
	WHERE estado = 1

	COMMIT
GO

EXEC SeleccionarCargos


/*INSERTAR CARGO*/
IF OBJECT_ID('InsertarCargo') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.InsertarCargo
END
GO
CREATE PROCEDURE dbo.InsertarCargo
	(
		@nombreCargo [varchar](25),
		@salarioCargo [decimal](6, 2)
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION

	INSERT INTO dbo.Cargo
	(
		nombreCargo, salarioCargo
	)
	VALUES
	(
		@nombreCargo,
		@salarioCargo
	)
	
	COMMIT
GO

EXEC InsertarCargo 'programador', 1000


/*Actualizar Cargo*/
IF OBJECT_ID('ActualizarCargo') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.ActualizarCargo
END
GO
CREATE PROCEDURE dbo.ActualizarCargo
	(
		@idCargo [int],
		@nombreCargo [varchar](25),
		@salarioCargo [decimal](6, 2)
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
		UPDATE dbo.Cargo
		SET  nombreCargo = @nombreCargo, salarioCargo = @salarioCargo
		WHERE idCargo = @idCargo
	COMMIT
GO


IF OBJECT_ID('EliminarCargo') IS NOT NULL
BEGIN
	DROP PROCEDURE dbo.EliminarCargo
END
GO
CREATE PROCEDURE dbo.EliminarCargo
	(
		@idCargo [int]
	)
AS
	SET NOCOUNT ON
	SET XACT_ABORT ON
	
	BEGIN TRANSACTION
		UPDATE dbo.Cargo
		SET  estado = 0
		WHERE idCargo = @idCargo
	COMMIT
GO

EXEC EliminarCargo