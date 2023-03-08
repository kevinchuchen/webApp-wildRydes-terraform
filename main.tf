provider "aws" {
    region = "us-east-1"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
}
#TODO
#DONE -- create IAM role for Amplify backend
#DONE -- create amplify environment and deploy app
#DONE -- app install for to give aws Github permissions
#DONE -- Create DDB
#DONE -- Create IAM role for Lambda function
#Create Lambda function

# module "create-codecommit-repo"{
#     source = "./modules/CodeCommit-repo"
# }

module "create-Cognito-resource"{
    source = "./modules/awsCognito_ssmParameter"
    cognitoPool-name = "wild-rydes-userPool"
    cognitoClient-name = "wildRydesClient"

    userPoolId_name  = "/amplify/${module.create-amplify-env.Amplify-App-ID}/prod/userPoolId"
    clientId_name  = "/amplify/${module.create-amplify-env.Amplify-App-ID}/prod/webClientId"
    nativeClientId_name  = "/amplify/${module.create-amplify-env.Amplify-App-ID}/prod/nativeClientId"
}


module "create-amplify-env"{
    source = "./modules/awsAmplify"
    source-repo = "https://github.com/kevinchuchen/webapp-wildRydes"
    GITHUB_ACCESS_TOKEN = var.GITHUB_ACCESS_TOKEN
    AMPLIFY_WEBCLIENT_ID = module.create-Cognito-resource.clientId
    AMPLIFY_USERPOOL_ID = module.create-Cognito-resource.userPoolId
    AMPLIFY_NATIVECLIENT_ID = module.create-Cognito-resource.clientId

}


# module "create-DynamoDB-table"{
#     source = "./modules/DynamoDB"
# }

# module "create-lambda-function"{
#     source = "./modules/Lambda"
#     lambda-dynamoDB-ARN = module.create-DynamoDB-table.DynamoDB-ARN
# }