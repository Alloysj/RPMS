<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Researcher</title>
        <link rel="stylesheet" href="profiles.css"/>
    </head>
    <body>
        <h2>Add New researcher</h2>
<<<<<<< HEAD


=======
>>>>>>> rpms1
        <form action="ResearcherServlet" method="post">

            <label for="fName">First Name:</label>
            <input type="text" id="fName" name="fName" required pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>
            <label for="lName">Last Name:</label>
            <input type="text" id="lName" name="lName" required pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>
<<<<<<< HEAD
            <label for="faculty" id="faculty">Faculty:</label>
            <select>
=======
            <label for="facultySelect">Select Faculty:</label><br>
            <select id="facultySelect" required>
                <option value="SELECT">SELECT FACULTY</option>
>>>>>>> rpms1
                <option value="FEDCOS">FEDCOS</option>
                <option value="FASS">FASS</option>
                <option value="FOA">FOA</option>
                <option value="FOS">FOS</option>
                <option value="FERD">FERD</option>
                <option value="LAW">LAW</option>
                <option value="ENGINEERING">ENGINEERING</option>
<<<<<<< HEAD
            </select><br><br>
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required pattern="[A-Za-z]+" title="Department cannot contain numbers"><br><br>

            <input type="submit" value="Submit">
        </form>
=======
                <option value="FHS">HEALTH SCIENCES</option>
                <option value="FVMS">VETERINARY MEDICINE AND SURGERY</option>
                <option value="IWGS">INSTITUTE OF WOMEN AND GENDER STUDIES</option>
            </select>
            <br><br>
            <label for="departmentSelect">Select Department:</label><br>
            <select id="departmentSelect" disabled required>
                <!-- Empty template to dynamically add departments -->
                <option></option>
            </select> <br><br>
            <<label>select file</label>
            <input type="file">
            <input type="submit" value="Submit">
        </form>

        <script>
            const facultySelect = document.getElementById("facultySelect");
            const departmentSelect = document.getElementById("departmentSelect");

// Departments for each faculty 
            const departments = {
                FEDCOS: ["Agricultural Education and Extension", "Applied Community Development Studies", "Curriculum instruction and Education Management", "Psychology, counseling and Education Foundations"],
                FOS: ["Biochemistry and Molecular Biology", "Biological Sciences", "Computer Science", "Mathematics", "Chemistry", "Physics"],
                FASS: ["Economics", "Literature, Languages and Linguistics", "History ,Philosophy and Religion", "Peace, Security and Social Studies"],
                FOA: ["Animal Sciences", "Dairy, Food Science and Technology", "Crops, Horticulture and Soil Sciences", "Agriculture Economics and Agribusiness Management"],
                FHS: ["Human Anatomy", "Internal Medicine Paediatrics and Child Health", "Clinical Medicine Community Health", "Human Nutrition Reproductive Health",
                    "Surgery", "Pathology", "Nursing", "Medical Physiology"],
                FERD: ["Department of Natural Resources", "Department of Environmental Science", "Department of Geography"],
                LAW: ["Law"],
                ENGINEERING: ["1. Agricultural Engineering (AGEN)", "2. Civil and Environmental Engineering (CEEN)", "3. Industrial and Energy Engineering (IEEN)", "4. Electrical and Control Engineering (ECEN)"],
                FVMS: ["Veterinary medicine and surery"],
                IWGS: ["Institute of women and gender studies"]
            };

// Event listener for faculty selection
            facultySelect.addEventListener("change", function () {
                const selectedFaculty = facultySelect.value;
                // Enable department select only if a faculty is selected
                departmentSelect.disabled = selectedFaculty === "";

                // Clear existing department options
                departmentSelect.innerHTML = "";

                // Populate department options based on selected faculty
                if (selectedFaculty in departments) {
                    const facultyDepartments = departments[selectedFaculty];
                    for (const dept of facultyDepartments) {
                        const option = document.createElement("option");
                        option.value = dept;
                        option.textContent = dept;
                        departmentSelect.appendChild(option);
                    }
                } else {
                    // Display a default option if no faculty is selected
                    const defaultOption = document.createElement("option");
                    defaultOption.value = "";
                    defaultOption.textContent = "Select Department";
                    departmentSelect.appendChild(defaultOption);
                }
            });
        </script>
>>>>>>> rpms1
    </body>
</html>
