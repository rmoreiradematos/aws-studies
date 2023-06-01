#criar um serviço de segurança para o lambda
#criar roles de seguranç na aws


aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log


#criar um arquivo com conteudo e zipa-lo.
zip function.zip index.js

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs18.x \
    --role arn:aws:iam::285888210961:role/lambda-exemplo \
    | tee logs/lambda-create.log


#invoke lambda

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log


#atualiza o arquivo com conteudo e zipa-lo.
zip function.zip index.js

#atualiza o lambda
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log
  
#invije kanbda novamente

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

#remove lambda
aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo

