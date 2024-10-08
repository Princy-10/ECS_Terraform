resource "aws_instance" "windows_ec2" {
  ami                    = var.ami_id   # Specify the Windows AMI ID
  instance_type          = var.instance_type
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  user_data = <<EOF
<powershell>
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install opsview-agent -y
Start-Process -NoNewWindow "C:\Program Files\Opsview Agent\bin\OpsviewAgent.bat" -ArgumentList '/server:<Opsview_Server_IP>'
</powershell>
EOF

  tags = {
    Name = "Windows-EC2-Opsview-Agent"
  }
  monitoring = true
}
resource "aws_security_group" "instance_sg" {
  name        = "ec2-windows-sg"
  description = "Allow RDP traffic"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from anywhere (modify as needed)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
