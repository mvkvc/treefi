import { useState, useEffect } from 'react';

// Needs work

const endpoint = process.env.NODE_ENV === 'development' ? 'http://localhost:4000/api/check' : 'https://treefi.xyz/api/check';

const useNetworkStatusPolling = (_endpoint) => {
  const [isConnected, setIsConnected] = useState(false);

  useEffect(() => {
    const intervalId = setInterval(() => {
      fetch(endpoint)
        .then(response => {
          if (response.ok) {
            setIsConnected(true);
          } else {
            setIsConnected(false);
          }
        })
        .catch(() => setIsConnected(false));
    }, 1000);

    // Clean up interval on component unmount
    return () => clearInterval(intervalId);
  }, [_endpoint]);

  return isConnected;
};


function App() {
  const isNetworkConnected = useNetworkStatusPolling(endpoint);
  const [message, setMessage] = useState("");

  useEffect(() => {
    if (isNetworkConnected) {
      setMessage("Redirecting...");
      // window.location.replace("/app");
    } else {
      setMessage("No connection...");
    }
  }, [isNetworkConnected]);

  return (
    <section>
      <h1>useNetworkState</h1>
      <p>{message}</p>
      <div>
        {isNetworkConnected ? (
          <p>You are online!</p>
        ) : (
          <p>You are offline. Please check your network connection.</p>
        )}
      </div>
    </section>
  );
}

export default App;
