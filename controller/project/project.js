const db = require("../../config/db")

// project registration
exports.projectRegistration = (req, res) => {
    if (req.user) {
        project_data = [
            req.body.title,
            req.user['uid'],
            req.body.location,
            req.body.monitoring,
            req.body.vvb,
            req.body.verification,
            req.body.milestone,
            req.body.baseline
        ]
        console.log(req.file)
        db.query("INSERT INTO project(title, userID,location,monit_period,vvb_contact,verification_plan,milestone,design_baseline) VALUES(?,?,?,?,?,?,?,?)", project_data, (err) => {
            if (!err) {
                res.status(200).json({ aset: "project successfully registered", data: project_data });
            } else {
                res.status(401).json({ aset: "failed to register project" });
                console.log(err)
            }
        });
    } else {
        res.status(501).json({ aset: "You don't have access." });
        console.log(`Verification issue`);

    }
};


// Display all project registered in the system
exports.showProject = (req, res) => {
    if (req.user) {
        db.query("SELECT * FROM project", (err, feedback) => {
            if (!err && feedback.length > 0) {
                var project_data = []
                for (i = 0; i < feedback.length; i++) {

                    project_data.push({ "name": feedback[i].title, "location": feedback[i].location, "monit": feedback[i].monit_period, "vvb": feedback[i].vvb_contact, "verification": feedback[i].verification_plan, "milestone": feedback[i].milestone, "baseline": feedback[i].design_baseline });
                }
                res.status(200).json({ aset: "Successfully data pulled", data: project_data })
            } else {
                res.status(401).json({ aset: "Data not existed.." })
            }
        });
    } else {
        res.status(501).json({ aset: "Sorry!!, You're not verified" });
    }

};

// exports module
module.exports;