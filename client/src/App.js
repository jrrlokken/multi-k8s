import "./App.css";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import OtherPage from "./OtherPage";
import Fib from "./Fib";

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <h3>Fibonacci Calculator</h3>
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other Page</Link>
        </header>
        <div>
          <Routes>
            <Route exact path="/" element={<Fib />} />
            <Route path="/otherpage" element={<OtherPage />} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
