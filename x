name: Devops CD pipeline

on:
 workflow_run:
   workflows:
     -Devops CI 

Pipeline
    types:
      -completed

jobs:

  deploy:

  runs-on: ubuntu-latest

  steps:

  -name: Deploy to Ec2
   uses: appleboy/ssh-action@v1.0.3

  with:
    host: ${{ secrets.EC2_HOST }}
    username: ${{ secretes.EC2_USER }}
    key: ${{ secrets.EC2_SSH_KEY }}

    script: |
      cd devops-cloud-platform
      git pull

      docker stop devops-app || true
      docker rm devops-app || true

      docker build -t devops-app || true

      docker run -d \
      --name devops-app \
      -p 80:80 \
      devops-app
