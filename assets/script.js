function ready(callback) {
  if (document.readyState != "loading"){
    callback();
  } else {
    document.addEventListener("DOMContentLoaded", callback);
  }
}

var appendToNode = function(node, el, content, className, callback) {
  var elementNode = document.createElement(el);
  if (content) { elementNode.innerText = content; }
  if (className) { elementNode.className = className; }
  if (callback) { callback(elementNode); }
  node.appendChild(elementNode);
};

var appendScore = function(node, skill) {
  appendToNode(node, "td", null, null, function(skillScore) {
    var max = Math.max(skill["current"], skill["goal"]);
    var min = Math.min(skill["current"], skill["goal"]);

    appendToNode(skillScore, "span", Array(min + 1).join("★"), "known");

    if (skill["current"] > skill["goal"]) {
      appendToNode(skillScore, "span", Array(max - min + 1).join("★"), "excess");
    } else {
      appendToNode(skillScore, "span", Array(max - min + 1).join("☆"), "gap");
    }

    appendToNode(skillScore, "span", Array(5 - max + 1).join("☆"));
  });
};

var appendSkillName = function(node, skill) {
  appendToNode(node, "td", skill["name"], null, function(skillName) {
    if (skill.hasOwnProperty("comment")) {
      skillName.className = "commented";
      appendToNode(skillName, "span", skill["comment"]);
    }
  });
};

var appendSkills = function(node, skills, category) {
  appendToNode(node, "table", null, null, function(categoryTable) {
    for (var skill in skills[category]) {
      var skillObj = skills[category][skill];
      var skillNode = document.createElement("tr");
      appendScore(skillNode, skillObj);
      appendSkillName(skillNode, skillObj);
      categoryTable.appendChild(skillNode);
    }
  });
};

var appendLearning = function(node, learnings, category) {
  appendToNode(node, "div", null, null, function(learningNode) {
    for (var learning in learnings[category]) {
      var learningObj = learnings[category][learning];
      appendToNode(learningNode, "h5", learningObj["name"]);
      if (learningObj.hasOwnProperty("progress")) {
        appendToNode(learningNode, "span", learningObj["progress"], "progress");
      }
      appendToNode(learningNode, "p", learningObj["description"], "description");
    }
  });
};

var appendSkillCategory = function(node, skills, category) {
  appendToNode(node, "div", null, null, function(categoryNode) {
    appendToNode(categoryNode, "h2", category);
    appendSkills(categoryNode, skills, category);
  });
};

var importSkills = function() {
  var skillContainer = document.getElementsByClassName("skills")[0];
  for (var category in SKILLS) {
    if (SKILLS.hasOwnProperty(category)) {
      appendSkillCategory(skillContainer, SKILLS, category);
    }
  }
};

var appendLearningCategory = function(node, learnings, category) {
  appendToNode(node, "div", null, null, function(categoryNode) {
    appendToNode(categoryNode, "h2", category);
    appendLearning(categoryNode, learnings, category);
  });
};

var importLearning = function() {
  var learningContainer = document.getElementsByClassName("learning")[0];
  for (var category in LEARNING) {
    if (LEARNING.hasOwnProperty(category)) {
      appendLearningCategory(learningContainer, LEARNING, category);
    }
  }
};

var animateClipboard = function(e) {
  var span = (e.target.id === "copy")? e.target : e.target.parentNode;
  span.children[0].src = "./images/clipboard-success-l.png";
  span.children[1].src = "./images/clipboard-success-d.png";
  span.className = "copy img-swap bounce"
  setTimeout(function() {
    span.children[0].src = "./images/clipboard-l.png";
    span.children[1].src = "./images/clipboard-d.png";
    span.className = "copy img-swap"
  }, 1200);
};

var main = function() {
  console.log("What are YOU doing here?");

  new Clipboard("#copy");
  document.getElementById("copy").addEventListener("click", animateClipboard);

  if (location.pathname.match("skills")) {
    importSkills();
  } else if (location.pathname.match("learning")) {
    importLearning();
  }
};

ready(main);
