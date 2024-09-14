1. Fiest i have created one ubuntu server in EC2 with t2.medium instance type, then the server through secton manager
   
2. Then i run these command to install java and jenkins

sudo apt-get update
sudo apt-get install -y openjdk-11-jdk
java --version

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins

3. Once that’s done, start the Jenkins service with the following command:
sudo systemctl start jenkins.service

4. To confirm its status, use:
sudo systemctl status jenkins

5. Adjust Firewall and Configuring Jenkinsiii
sudo ufw allow 8080
sudo ufw enable

6.Once done, test whether the firewall is active or not using this command:

sudo ufw status
Then we see jenkins is showing active

Now we can acces our jenkins then i tae the public ip of the master server where we install jenkins and paste it in the browser with 8080 ports.
Then in the jenkins  dashboard , i create a pipeline jobs name "JOB-1 " then go to configure section here the jenkins file - 


