resource "aws_db_instance" "postgres" {
  engine = "postgres"
  instance_class = "db.t3.micro"
  allocated_storage = 20

  username = "postgres"
  password = "Password123"

  db_name = "contacts"
  skip_final_snapshot = true
}