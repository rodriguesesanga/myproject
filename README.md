# Health Data Hub Script

This project contain two scrips (Shell & powershell) that allows make some actions on Virtual machine and Azure cloud resources.

## 1. Shell
      This is the SHELL script for:
      - Retriving .conf files on VM linux
      - Puting files in local path
      - Creating a tarball with these files
      - Uploading tarball generated in Storage Account Azure as a blob

- 
   ### 1. REQUIREMENTS

    - VM Linux (that contains .conf files to extract)
    - Azure Storage Account ( with container blob)
    - AzCopy CLI for uploading tarball in Storage Account.
    - Azure DevOps account for automating script running in pipeline.
   
   ### 2. VARIABLES
    - HOST_PATH :  format user@host:path
    - LOCAL_PATH:  path as string
    - STORAGE_ACCOUNT: format <name:container> ( Default value set)
    - LAUNCH_MODE: <dry-run> for skipping script running.
   
   ### 3. RUNNING SCRIPT
    - .\myscript.sh $(HOST_PATH) $(LOCAL_PATH) $(STORAGE_ACCOUNT) $(LAUNCH_MODE)
    
## 2. Powershell
      This is a powershell script for adding user to a VM.
   ### 1. REQUIREMENTS
   - az CLI installed
   
   ### 2. VARIABLES
   - USERNAME : user to add VW windows
   - PASSWORD : user's password
   - VMwin    : The virtual machine name
   - RES_GROUP: The Ressource Group of VM
   
   ### 3. RUNNING
   
  .\powerscript.ps1 USERNAME PASSWORD VMwin RES_GROUP