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

var appendName = function(node, skill) {
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

var appendSkills = function(node, skills, category) {
  var categoryTable = document.createElement("table");
  for (var skill in SKILLS[category]) {
    var skillObj = SKILLS[category][skill];
    var skillNode = document.createElement("tr");
    appendScore(skillNode, skillObj);
    appendName(skillNode, skillObj);
    categoryTable.appendChild(skillNode);
  }
  node.appendChild(categoryTable);
};

var appendCategory = function(node, skills, category) {
  var categoryNode = document.createElement("div");
  appendHeader(categoryNode, category);
  appendSkills(categoryNode, skills, category);
  node.appendChild(categoryNode);
};

var importSkills = function() {
  var skillContainer = document.getElementsByClassName("skills")[0];
  for (var category in SKILLS) {
    if (SKILLS.hasOwnProperty(category)) {
      appendCategory(skillContainer, SKILLS, category);
    }
  }
};

var main = function() {
  new Clipboard("#copy");

  if (location.pathname.match("skills")) {
    importSkills();
  }
};

ready(main);
