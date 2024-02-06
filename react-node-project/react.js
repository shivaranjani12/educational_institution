import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [data, setData] = useState('');

  useEffect(() => {
    axios.get('http://localhost:6060/api/users')
      .then(response => {
        setData(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  }, []);

  return (
    <table>
    <thead><th>ID</th>
    <th>Name</th>
    <th>Email</th>
    </thead>
    <tbody>
      {data.map( (d,i)=>(
          <tr><td>{d.user_id}</td>
          <td>{d.firstName}</td>
          <td>{d.lastName}</td>
          <td>{d.email}</td>
          </tr>
      ))}
    </tbody>
  </table>
  );
}

export default App;
