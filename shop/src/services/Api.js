//importamos axios y store
import axios from "axios";
import store from "../store";
//creamos el api con axios
export default () => {
  return axios.create({
    baseURL: `http://localhost:8081`,
    headers: {
      Authorization: `Bearer ${store.state.CurrentUser?.token || ""}`,
    },
  });
};
