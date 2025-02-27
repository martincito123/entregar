# Contexto :
El presente proyecto despliega una aplicacion basica que sirve para probar las funcionalidades del integrar packer, ansible , terraform y aws para desplegar infraestructura como codigo immutable . Se desplegara una aplicacion web que emula las funciones de un juego de celular llamado clumsy bird . 

# Laboratorio :
1. Primero se tiene que clonar el repositorio en una maquina linux de preferencia .
2. Asegurarse de contar con las dependencias necesarias para ejecutar lo necesario .
   
   2.1 aws cli , ansible , packer , terraform

   2.2 configurar aws cli para que obtenga las variables de la cuenta a utilizar para realizar el despliegue : aws access key y secret key . 

4. Al clonar el repositorio este tendra la siguiente estructura
   
   3.1 folder ansible : dependencias de ansible
   
   3.2 folder assets : parametros necesarios para ejecutar la app clumsy bird

   3.3 folder playbooks: playbooks de ansible necesarios para poder construir la imagen AMI
   
   3.4 folder packer_terraform: carpeta que cuenta con la integracion de terraform y packer , servira poder desplegar la instancia con la aplicacion una vez se cuente con la AMI ya construida .

   3.5 main.tf: IaaC infra como codigo necesaria para poder desplegar la instancia . 
   
![image](https://github.com/user-attachments/assets/2b512e89-52cf-478d-87ad-ef813a0877d7)


5. Situarse en la carpeta /ansible y luego ejecutar los siguientes comandos de validacion previamente teniendo los binarios necesarios . de lo contrario no funcionara .

   5.1 packer fmt .
   
   5.2 packer validate .


   ![image](https://github.com/user-attachments/assets/6502293c-2e19-4821-9bff-44346302be93)


debe de salir que la configuracion es valida . Es te paso es necesario ya que primero se contruira la AMI con los parametros necesarios para luego poder desplegarla 

 

6. ejecutar  <  packer build . >  en la ruta   <home/sebastian/Escritorio/LABS/ansible >

7. Luego esperamos que packer y ansible hagan el trabajo de crear esta AMI , esto lo hara usando los playbooks que ya esta seteados en la carpeta playbooks y en el archivo de packer tambien estan referenciados , solo resta esperar a que termine el comando packer build .


![image](https://github.com/user-attachments/assets/75bebb76-e0b7-4109-b97c-2748954bd5d2)




![image](https://github.com/user-attachments/assets/abe13ed7-42f0-4ebe-a7d1-7478e2dcc618)





![image](https://github.com/user-attachments/assets/a6dac6be-8d88-4b81-9581-c9bc82a41358)





8. Validamos en la nube la creacion de la imagen .

   ![image](https://github.com/user-attachments/assets/70737748-7752-48b2-beaa-3fa21158e511)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

10. con esta imagen ya instalada en la nube podemos proceder a la parte de Iaac usando terraform y packer .

11. Nos situamos en esta carpeta para luego poder ejecutar los comandos basicos de terraform ( init , plan, apply , destroy )

![image](https://github.com/user-attachments/assets/5bae30f5-5922-4cf5-b187-6e6ad0729793)

12. Considerar los siguientes datos a completar para poder desplegar la imagen AMI .

      Considerar sola y unicamente estos valores :

    
    12.1 APPLICATION IMAGE TO DEPLOY : EL ID DEL AMI GENERADO EN AWS


    12.2 NAME DE LA APP: ClumsyBird


    ![image](https://github.com/user-attachments/assets/f53a81bf-8336-44d9-8156-fec09588fbf2)




13. Continuar con el flujo basico de terraform init plan apply .


14. Revisar la consola cuando termine la ejecucion del terraform y verificar si la instancia desplego .


 ![image](https://github.com/user-attachments/assets/078b5d79-cdf7-4e9b-864b-7561b3acccc7)







15. Si queremos destruir la infra porfavor considerar lo siguiente al momento de darle terraform destroy

    

   15.1 APPLICATION IMAGE TO DEPLOY : EL ID DEL AMI GENERADO EN AWS

   

   15.2 NAME DE LA APP: ClumsyBird



   EJEMPLO : 


   ![image](https://github.com/user-attachments/assets/be112ca9-ab50-42ed-a6df-b66a0bd93092)



   
   

