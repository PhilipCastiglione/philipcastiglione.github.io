var SKILLS = {
  "Artificial Intelligence": [
    {
      "name": "Classifiers and statistical learning",
      "current": 0,
      "goal": 4
    },
    {
      "name": "Epistemology",
      "current": 0,
      "goal": 4,
      "comment": "in the context of AI this seems to be often referred to as 'Knowledge Representation and Reasoning (KR)'"
    },
    {
      "name": "Logic and Symbology",
      "current": 0,
      "goal": 4
    },
    {
      "name": "Neural Networks",
      "current": 0,
      "goal": 4
    },
    {
      "name": "Search and Optimization",
      "current": 1,
      "goal": 4
    }
  ],
  "Back End Web Development": [
    {
      "name": "Internet Protocols, Request Structure & Routing",
      "current": 2,
      "goal": 0
    },
    {
      "name": "Ruby on Rails",
      "current": 3,
      "goal": 0
    },
    {
      "name": "Sinatra",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Web/Application Security",
      "current": 1,
      "goal": 0
    }
  ],
  "Computer Hardware": [
    {
      "name": "Desktop PC Components",
      "current": 1,
      "goal": 1,
      "comment": "ie. motherboard, cpu (ALU, local/cached memory, control unit), ram, hard drive/ssd, graphics/video card, PSU, network/wireless, optical drive, input/output peripherals, heat distribution, cable management"
    },
    {
      "name": "High Powered/Specialized Computing",
      "current": 0,
      "goal": 2
    }
  ],
  "Computer Science": [
    {
      "name": "Algorithms",
      "current": 1,
      "goal": 4
    },
    {
      "name": "Computer Architecture",
      "current": 1,
      "goal": 1
    },
    {
      "name": "Concurrent, Parallel & Distributed Systems",
      "current": 0,
      "goal": 3
    },
    {
      "name": "Data Structures",
      "current": 1,
      "goal": 4
    },
    {
      "name": "Logic for Computation",
      "current": 1,
      "goal": 4
    },
    {
      "name": "Optimisation",
      "current": 1,
      "goal": 2
    }
  ],
  "Data Management": [
    {
      "name": "In Memory Store",
      "current": 1,
      "goal": 1,
      "comment": "Redis"
    },
    {
      "name": "RDBMS Theory & Application",
      "current": 1,
      "goal": 1
    },
    {
      "name": "SQL Databases",
      "current": 1,
      "goal": 1,
      "comment": "Postgres, MySQL"
    }
  ],
  "Dev & Sys Ops": [
    {
      "name": "AWS",
      "current": 1,
      "goal": 0,
      "comment": "EC2, EBS, ElasticBeanstalk, RDS, Lambda, S3, Glacier, Auto Scaling, Load Balancing, ElastiCache, Cloudfront"
    },
    {
      "name": "Capistrano",
      "current": 1,
      "goal": 0
    },
    {
      "name": "CI/CD",
      "current": 1,
      "goal": 0,
      "comment": "Continuous Integration, Delivery & Deployment"
    },
    {
      "name": "Docker",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Git",
      "current": 3,
      "goal": 3
    },
    {
      "name": "Heroku",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Linux",
      "current": 1,
      "goal": 2
    },
    {
      "name": "Mac OS",
      "current": 2,
      "goal": 2
    },
    {
      "name": "Networking",
      "current": 1,
      "goal": 1
    },
    {
      "name": "Server/Sys Admin",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Shell Scripting",
      "current": 1,
      "goal": 2
    },
    {
      "name": "Windows",
      "current": 1,
      "goal": 2
    }
  ],
  "Front End Web Development": [
    {
      "name": "Browsers",
      "current": 2,
      "goal": 0
    },
    {
      "name": "CSS/Sass",
      "current": 2,
      "goal": 0
    },
    {
      "name": "Ember",
      "current": 2,
      "goal": 0
    },
    {
      "name": "HTML",
      "current": 2,
      "goal": 0
    },
    {
      "name": "Modern Web Development",
      "current": 2,
      "goal": 0,
      "comment": "Cross browser, cross platform design, accessibility..."
    },
    {
      "name": "React",
      "current": 1,
      "goal": 0,
      "comment": "with redux"
    }
  ],
  "Languages": [
    {
      "name": "C",
      "current": 2,
      "goal": 2
    },
    {
      "name": "C++",
      "current": 0,
      "goal": 3
    },
    {
      "name": "Haskell",
      "current": 0,
      "goal": 1
    },
    {
      "name": "Java",
      "current": 1,
      "goal": 1
    },
    {
      "name": "JavaScript",
      "current": 2,
      "goal": 0,
      "comment": "ES6"
    },
    {
      "name": "PHP",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Python",
      "current": 1,
      "goal": 3
    },
    {
      "name": "R",
      "current": 0,
      "goal": 3
    },
    {
      "name": "Ruby",
      "current": 3,
      "goal": 0
    },
    {
      "name": "SQL",
      "current": 1,
      "goal": 0
    },
    {
      "name": "TypeScript",
      "current": 1,
      "goal": 0
    }
  ],
  "Machine Learning": [
    {
      "name": "Reinforcement Learning",
      "current": 0,
      "goal": 4,
      "comment": "TODO: increase granularity"
    },
    {
      "name": "Supervised Learning",
      "current": 0,
      "goal": 4,
      "comment": "TODO: increase granularity"
    },
    {
      "name": "Unsupervised Learning",
      "current": 0,
      "goal": 4,
      "comment": "TODO: increase granularity"
    }
  ],
  "Mathematics": [
    {
      "name": "Lambda Calculus",
      "current": 1,
      "goal": 2
    },
    {
      "name": "Linear Algebra",
      "current": 1,
      "goal": 3
    },
    {
      "name": "Statistics & Probability",
      "current": 1,
      "goal": 3
    }
  ],
  "Native Phone": [
    {
      "name": "Cordova",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Apple Dev/Store Process",
      "current": 1,
      "goal": 0
    }
  ],
  "Software Development": [
    {
      "name": "API Design",
      "current": 3,
      "goal": 0
    },
    {
      "name": "Design Patterns",
      "current": 1,
      "goal": 0
    },
    {
      "name": "Development Methodologies",
      "current": 2,
      "goal": 2,
      "comment": "Tools and systems ranging from Agile development methodologies to kanban tools and open source PR workflow"
    },
    {
      "name": "Functional Programming",
      "current": 1,
      "goal": 2
    },
    {
      "name": "Object Oriented Programming",
      "current": 2,
      "goal": 3
    },
    {
      "name": "Requirements Capture",
      "current": 3,
      "goal": 2
    },
    {
      "name": "Solution Design",
      "current": 2,
      "goal": 2
    },
    {
      "name": "System Architecture",
      "current": 1,
      "goal": 1
    }
  ],
  "Testing": [
    {
      "name": "RSpec",
      "current": 2,
      "goal": 0
    },
    {
      "name": "TDD/BDD",
      "current": 2,
      "goal": 2,
      "comment": "Test Driven Design/Behaviour Driven Design"
    },
    {
      "name": "Testing Techniques & Strategy",
      "current": 2,
      "goal": 2
    }
  ]
};
