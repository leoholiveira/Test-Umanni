import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="admin--users"
export default class extends Controller {
  static targets = ['list', 'total', 'clients', 'admins'];
  connect() {
    this.allUser()
    this.calculateUsers();
  }

  async importFile(event) {
    const formData = new FormData();
    const fileField = document.querySelector('input[type="file"]');
    formData.append("file", fileField.files[0]);
    console.log(event.target.value);
    const response = await fetch('/admin/import-csv', {
      credentials: "same-origin",
      method: 'POST',
      body: formData
    })
    
    const result = await response.json();

    this.allUser();
    this.calculateUsers();
  }

  allUser() {
    this.calculateUsers();
    fetch('/admin/users.json')
      .then(response => response.json())
      .then(data => {
        this.users = data;
        this.reloadUsers();
      });
  }

  clientUser() {
    fetch('/admin/users.json?type=client')
      .then(response => response.json())
      .then(data => {
        this.users = data;
        this.reloadUsers();
      });
  }

  adminUser() {
    fetch('/admin/users.json?type=admin')
      .then(response => response.json())
      .then(data => {
        this.users = data;
        this.reloadUsers();
      });
  }

  calculateUsers() {
    fetch('/admin/dashboard.json')
      .then(response => response.json())
      .then(data => {
        this.clientsTarget.innerHTML = data.clients
        this.adminsTarget.innerHTML = data.admins
        this.totalTarget.innerHTML = data.total
      });
  }

  reloadUsers() {
    this.listTarget.innerHTML = this.users.map(user => `
    <tr>
      <td>${user.id}</td>
      <td>${user.fullname}</td>
      <td>${user.email}</td>
      <td><img class="img-thumbnail" style="max-width: 60px; max-height: 50px;" src="${user.avatar_image}" /></td>
      <td>${user.user_type}</td>
      <td>
        <form class="button_to" method="post" action="/admin/users/${user.id}">
          <a href="/admin/users/${user.id}/edit" class="btn btn-primary btn-sm">Edit</a>
          <input type="hidden" name="_method" value="delete" autocomplete="off">
          <button class="btn btn-danger btn-sm" type="submit">Delete</button>
        </form>
      </td>
    </tr>`).join('');
  }
}
