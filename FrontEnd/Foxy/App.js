import React, { useState } from "react";
import axios from "axios";

// import "./styles.css";

const foxUrl = "https://randomfox.ca/floof/";
const dogUrl = "https://dog.ceo/api/breeds/image/random";

export default function App() {
  const [img, setImg] = useState("");

  const fetcher = async () => {
    let { data } = await axios.get(foxUrl);
    setImg(data.image);
  };

  return (
    <div className="main">
      <button onClick={() => fetcher()}>Click</button>
      <p>Random animal generator.</p>
      <img src={img} alt="fox" />
    </div>
  );
}
