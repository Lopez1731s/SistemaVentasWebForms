/****** Script for SelectTopNRows command from SSMS  ******/
insert into usuario([idEmpleado]
      ,[idTipoUsuario]
      ,[nombreUsuario]
      ,[contraseniaUsuario])
	  values (1,1,'marlonAdmin','4854gfg')

insert into usuario([idEmpleado]
      ,[idTipoUsuario]
      ,[nombreUsuario]
      ,[contraseniaUsuario])
	  values (2,1,'omar_XD','4744gfg')


insert into usuario([idEmpleado]
      ,[idTipoUsuario]
      ,[nombreUsuario]
      ,[contraseniaUsuario])
	  values (3,2,'henry_XD','ert456')


	  INSERT dbo.Usuario
	  (
	      --idUsuario - column value is auto-generated
	      idEmpleado,
	      idTipoUsuario,
	      nombreUsuario,
	      contraseniaUsuario
	  )
	  VALUES
	  (
	      -- idUsuario - int
	      1,
	      1,
	      'marlonAdmin', -- nombreUsuario - varchar
	      HASHBYTES('MD5','1234')
	  )

	  	  INSERT dbo.Usuario
	  (
	      --idUsuario - column value is auto-generated
	      idEmpleado,
	      idTipoUsuario,
	      nombreUsuario,
	      contraseniaUsuario
	  )
	  VALUES
	  (
	      -- idUsuario - int
	      2,
	      2,
	      'carlosBasico', -- nombreUsuario - varchar
	      HASHBYTES('MD5','1234')
	  )
