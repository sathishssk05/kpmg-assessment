## Simple Shell Script to Fetch the EC2 Metadata

# Prerequesties

 ```bash
   - aws cli 
   - aws Access & Secret Key
 ```

```bash
Example KEY="Reservations[0].Instances[0].InstanceType" 
```
```bash
Example INSTANCE_ID="i-031a96c0cc00a7984"
```
```
# demo key AKIA4OG6NSSKGQW2Y3TXKSS4NU
# demo secret EL6WKSSK52ifAdXJ/+lbsVwB+S5rsY4G+6vx1XKSSYepzu

```

# Steps
```
 - Make sure you are in the right directory structure where the "hydra.sh" is located and run the following commands.
 
 ```bash
 chmod +x hydra.sh  # Permission for execute
 ```
 ```bash
 ./hydra.sh 
 ```
- Feed the AWS Access & Secret Key to authentication with AWS cloud API's

- Provide the Region
  ```bash
  e.g asia-southeast-1
  ```
- Enter the EC2 Instance ID which you need to fetch the metadata (Mandatory Input)
  ```bash
  e.g i-031a96c0cc00a7984
  ```
- Enter yes / no to proceed with specific / all metadata fetch
  ```bash
  e.g Reservations[0].Instances[0].InstanceType
  ```
- The expected Results will be populated on the terminal.
