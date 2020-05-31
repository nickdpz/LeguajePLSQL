set serveroutput on;

DECLARE
fechaNumber number;
fechaChar nvarchar2(100);
--fechaTrunc number;

BEGIN
  select fechanaci as Fecha, edad_actual(fechanaci) as EDAD from empleados
    where edad_actual(fechanaci)>=35
  
END;