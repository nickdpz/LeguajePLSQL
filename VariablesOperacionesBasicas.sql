set serveroutput on;

DECLARE
 -- Definimos las constantes
 PORCENTAJE constant number := 0.15;
  -- Definimos las variables
  cantidadCamisetas number:=4; 
  costoCamisetas number:=1000;
  subTotal number;
  impuestoVenta number;

BEGIN
subTotal:=cantidadCamisetas*costoCamisetas;
impuestoVenta:=PORCENTAJE*subTotal;
 dbms_output.put_line('Sub Total : '||subTotal );
 dbms_output.put_line('Impuesto 0'|| PORCENTAJE ||'% : '|| impuestoVenta );
  dbms_output.put_line('Total: '|| (impuestoVenta+subTotal) );
 
   
END;