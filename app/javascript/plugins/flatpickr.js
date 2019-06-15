import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
  disableMobile: true,
  altInput: true,
  // altFormat: "F j, Y",
  enableTime: true,
  dateFormat: "Y-m-d H:i",
})
