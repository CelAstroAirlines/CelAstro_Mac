import ax from "axios"

const token = document.querySelector("meta[name=csrf-token]").content
ax.defaults.headers.common["X-CSRF-Token"] = token

export default ax