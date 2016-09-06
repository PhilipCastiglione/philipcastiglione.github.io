function ready(cb) {
  if (document.readyState != "loading"){
    cb();
  } else {
    document.addEventListener("DOMContentLoaded", cb);
  }
}

var appendHeader = function(node, category) {
  var categoryHeader = document.createElement("h2");
  categoryHeader.innerText = category;
  node.appendChild(categoryHeader);
};

var appendDescription = function(node, learning) {
  var learningDescription = document.createElement("p");
  learningDescription.className = "description";
  learningDescription.innerText = learning["description"];
  node.appendChild(learningDescription);
};

var appendScore = function(node, skill) {
  var skillScore = document.createElement("td");
  var known = skill["current"];
  var goal = skill["goal"];
  var knownStarNode = document.createElement("span");

  knownStarNode.className = "known";
  var emptyStarNode = document.createElement("span");

  if (known >= goal) {
    knownStarNode.innerText = Array(goal + 1).join("★");
    skillScore.appendChild(knownStarNode);

    var excessStarNode = document.createElement("span");
    excessStarNode.className = "excess";
    excessStarNode.innerText = Array(known - goal + 1).join("★");
    skillScore.appendChild(excessStarNode);

    emptyStarNode.innerText = Array(5 - known + 1).join("☆");
  } else {
    knownStarNode.innerText = Array(known + 1).join("★");
    skillScore.appendChild(knownStarNode);

    var gapStarNode = document.createElement("span");
    gapStarNode.className = "gap";
    gapStarNode.innerText = Array(goal - known + 1).join("☆");
    skillScore.appendChild(gapStarNode);

    emptyStarNode.innerText = Array(5 - goal + 1).join("☆");
  }

  skillScore.appendChild(emptyStarNode);

  node.appendChild(skillScore);
};

var appendProgress = function(node, learning) {
  var learningProgress = document.createElement("span");
  learningProgress.className = "progress";
  learningProgress.innerText = learning["progress"];
  node.appendChild(learningProgress);
};

var appendSkillName = function(node, skill) {
  var skillName = document.createElement("td");
  skillName.innerText = skill["name"];

  if (skill.hasOwnProperty("comment")) {
    skillName.className = "commented";
    var commentNode = document.createElement("span");
    commentNode.innerText = skill["comment"];
    skillName.appendChild(commentNode);
  }

  node.appendChild(skillName);
};

var appendLearningName = function(node, learning) {
  var learningName = document.createElement("h5");
  learningName.innerText = learning["name"];
  node.appendChild(learningName);
};

var appendSkills = function(node, skills, category) {
  var categoryTable = document.createElement("table");
  for (var skill in skills[category]) {
    var skillObj = skills[category][skill];
    var skillNode = document.createElement("tr");
    appendScore(skillNode, skillObj);
    appendSkillName(skillNode, skillObj);
    categoryTable.appendChild(skillNode);
  }
  node.appendChild(categoryTable);
};

var appendLearning = function(node, learnings, category) {
  var learningNode = document.createElement("div");
  for (var learning in learnings[category]) {
    var learningObj = learnings[category][learning];
    appendLearningName(learningNode, learningObj);
    if (learningObj.hasOwnProperty("progress")) {
      appendProgress(learningNode, learningObj);
    }
    appendDescription(learningNode, learningObj);
  }
  node.appendChild(learningNode);
};

var appendSkillCategory = function(node, skills, category) {
  var categoryNode = document.createElement("div");
  appendHeader(categoryNode, category);
  appendSkills(categoryNode, skills, category);
  node.appendChild(categoryNode);
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
  var categoryNode = document.createElement("div");
  appendHeader(categoryNode, category);
  appendLearning(categoryNode, learnings, category);
  node.appendChild(categoryNode);
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
  new Clipboard("#copy");
  document.getElementById("copy").addEventListener("click", animateClipboard);

  if (location.pathname.match("skills")) {
    importSkills();
  } else if (location.pathname.match("learning")) {
    importLearning();
  }

};

ready(main);
