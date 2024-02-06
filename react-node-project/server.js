const express = require('express');
const cors = require('cors');
const app = express();
const port = 6060;
const usersRoutes = require('./educational_institution/src/api/user/usersRoutes');
const studentsRoutes = require('./educational_institution/src/api/student/studentsRoutes');
const coursesRoutes = require('./educational_institution/src/api/course/coursesRoutes');
const enrollRoutes = require('./educational_institution/src/api/enrollment/enrollRoutes');
const examsRoutes = require('./educational_institution/src/api/exam/examsRoutes');
const assignmentsRoutes = require('./educational_institution/src/api/assignments/assignmentsRoutes');

app.use(express.json());

// Use the cors middleware to allow cross-origin requests
app.use(cors());
app.use('/api/users', usersRoutes);
app.use('/api/student', studentsRoutes);
app.use('/api/enrollment', enrollRoutes);
app.use('/api/course', coursesRoutes);
app.use('/api/assignments', assignmentsRoutes);
app.use('/api/exam', examsRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
