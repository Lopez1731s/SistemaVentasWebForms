
SELECT TOP 1000 [idVentaOnline]
      ,[idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente]
      ,[estado]
  FROM [Esta].[dbo].[VentaOnline]

insert into ventaOnline([idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente])
	  values(1,1,convert(time,getdate()),convert(date,getdate()))

insert into ventaOnline([idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente])
	  values(2,2,convert(time,getdate()),convert(date,getdate()))

insert into ventaOnline([idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente])
	  values(3,3,convert(time,getdate()),convert(date,getdate()))

insert into ventaOnline([idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente])
	  values(4,4,convert(time,getdate()),convert(date,getdate()))

insert into ventaOnline([idDetalleVenta]
      ,[idClienteUsuario]
      ,[horaVentaCliente]
      ,[fechaVentaCliente])
	  values(5,5,convert(time,getdate()),convert(date,getdate()))