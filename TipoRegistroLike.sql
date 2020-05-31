set serveroutput on;

DECLARE
  
    reg_empleado empleados%rowtype;

BEGIN

    Select * into reg_empleado from empleados where nombre like '%T%';
    
    dbms_output.put_line(  reg_empleado.nombre );
    dbms_output.put_line(  reg_empleado.id );
    dbms_output.put_line(  reg_empleado.salario );
    dbms_output.put_line(  reg_empleado.actualizado );

END;