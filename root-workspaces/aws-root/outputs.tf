
output "usernames_and_initial_passwords" {
  value = {
    for profile in module.users : profile.username => profile.initial_password
  }
}