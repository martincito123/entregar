# Contexto :

El presente proyecto despliega una aplicacion basica que sirve para probar las funcionalidades del integrar packer ansible terraform y aws para desplegar infraestructura como codigo immutable . Se desplegara una aplicacion web (emula las funciones de un juego de celular llamado clumsy bird) 

# Laboratorio :
1. Primero se tiene que clonar el repositorio en una maquina linux de preferencia .
2. Asegurarse de contar con las dependencias necesarias para ejecutar lo necesario .
   
   2.1 aws cli , ansible , packer , terraform

4. Al clonar el repositorio este tendra la siguiente estructura
   
   3.1 folder ansible : dependencias de ansible
   
   3.2 folder assets : parametros necesarios para ejecutar la app clumsy bird

   3.3 folder playbooks: playbooks de ansible necesarios para poder construir la imagen AMI
   
   3.4 folder packer_terraform: carpeta que cuenta con la integracion de terraform y packer , servira poder desplegar la instancia con la aplicacion una vez se cuente con la AMI ya construida .

   3.5 main.tf: IAAC infra como codigo necesaria para poder desplegar la instancia . 
   
![image](https://github.com/user-attachments/assets/2b512e89-52cf-478d-87ad-ef813a0877d7)


5. Situarse en la carpeta /ansible y luego ejecutar los siguientes comandos de validacion previamente teniendo los binarios necesarios . de lo contrario no funcionara .

   5.1 packer fmt .
   
   5.2 packer validate .


   ![image](https://github.com/user-attachments/assets/6502293c-2e19-4821-9bff-44346302be93)


 debe de salir que la configuracion es valida . Es te paso es necesario ya que primero se contruira la AMI con los parametros necesarios para luego poder desplegarla 

