# Simple Shell Script to Fetch the EC2 Metadata

## Prerequesties

 ```bash
   - aws cli  # aws cli should be installed, if not please refer the following doc. https://aws.amazon.com/cli/
   - aws Access & Secret Key  # Keep the necessary Auth Keys to get AWS Programmatic Access. For further info refer the following doc. https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/
 ```


## Steps

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
- Enter yes / no to proceed with specific / all metadata fetch. --> i.e if "yes" feed the below value as a input & if "no" all the metadata values will be fecthed for the specific EC2.
  ```bash
  e.g Reservations[0].Instances[0].InstanceType
  ```
- The expected Results will be populated on the terminal.
```