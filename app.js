const express = require("express");
thisVariableDoesNotExist();
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.static("views"));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "views", "index.html"));
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
