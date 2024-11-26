import Dialog from "@stimulus-components/dialog";
import { FetchRequest } from '@rails/request.js'

export default class extends Dialog {
  connect() {
    super.connect(); // Ensure parent initialization runs
    console.log("Dialog controller connected.");
  }

  open(event) {
    super.open(); // Calls the parent's open logic
    console.log("Custom open logic executed.");
    const patientId = event.currentTarget.dataset.value;
    console.log("PATIENT", patientId);
    this.myRequest(patientId);
    // Add additional custom logic for opening the modal if needed
  }

  close() {
    console.log("Custom close logic executed before closing."); 
    super.close(); // Calls the parent's close logic
  }

  backdropClose(event) {
    if (event.target === this.dialogTarget) {
      console.log("Custom backdrop close logic executed.");
      super.backdropClose(event); // Calls the parent's backdrop close logic
    }
  }


  async myRequest(patientId) {
    console.log("Making a request...");

    // Create a FetchRequest and handle the response
    const request = new FetchRequest('get', `/patients/${patientId}.json`, {
      headers: { 'Content-Type': 'application/json' }
    });

    try {
      const response = await request.perform();
      if (response.ok) {
        const body = await response.json;
        console.log("Response received:", body);

        // Update modal content with the response data
        this.updateModalContent(body);
      } else {
        console.error("Request failed with status:", response.status);
      }
    } catch (error) {
      console.error("Error during request:", error);
    }
  }

  updateModalContent(data) {
    // Update the modal content dynamically based on the response
    const modalContent = this.dialogTarget.querySelector('#modal-content');
    modalContent.innerHTML = `
      <h3>Patient Details</h3>
      <p><strong>Name:</strong> ${data.first_name} ${data.last_name}</p>
      <p><strong>Email:</strong> ${data.email}</p>
      <p><strong>Phone:</strong> ${data.phone_number}</p>
      <p><strong>Date of Birth:</strong> ${data.date_of_birth}</p>
      <p><strong>Gender:</strong> ${data.gender}</p>
      <p><strong>Created at:</strong> ${data.created_at}</p>

    `;
  }

}
