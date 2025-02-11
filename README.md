# zairza_app

**Profile**
1. Register:
   POST:https://zairzaappbackend.onrender.com/zairza/register
   BODY: {
   "first_name":"Dinesh",
   "last_name":"Kalo",
   "registration_number":"2211100195",
   "branch":"CSE",
   "phone_number":"6371685638",
   "email":"dineshkumarkalo2gmail.com",
   "password":"Mynameisdinesh",
   "batch":"3rd Year"
   }
2. Login:
   POST:https://zairzaappbackend.onrender.com/zairza/login
   Body:{
   "input":"ZAarI001754”,
   "password”:”Password”
   }
3. Get Profile
   GET:https://zairzaappbackend.onrender.com/zairza/getProfile
   Headers:”Authorization”

   **Blog**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/createBlog
   BODY:{
   "title":"Testing",
   "description":"This is a test Blog",
   "wing":"Software",
   "image":"Here is a image url",
   "links":"Here contains all the links"
   }
2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/getBlogs
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/getBlog/67701214a072bda243198823

**Project**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/createProject
   BODY:{
      "title": "Zairzest Website",
      "date_and_time": "2025-01-07T10:30:00Z",
      "wing": "Software",
      "status": "Completed",
      "project_img": "Image link",
      "description": "This is Zairzest website.",
      "senior_incharge": "AV",
      "links": [
         {
         "name": "Zairzest Website",
         "url": "https://github.com/DineshKalo/zairza-app"
         }
       ]
      }
2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/retrieveProjects
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/retrieveProject/677d14377d6ba125019f289c

**Roadmap**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/uploadRoadmap
   BODY:{
   "name": "Web Development Roadmap",
   "links": "https://example.com/web-development-roadmap"
   }
2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/getRoadmap
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/getRoadmap/677d2651ded919a9555ad44b

**Session**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/uploadSession
   BODY:{
   "name": "Introduction to Flutter",
   "url": "https://example.com/introduction-to-flutter-presentation"
   }
2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/getSession
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/getSession/677d30cd0a84f3c0499bd695

 **Event**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/uploadEvent
   BODY:{
   "title": "AI and Robotics Workshop",
   "date_and_time": "2025-04-20T09:30:00Z",
   "wing": "Software",
   "event_img": "https://example.com/ai-robotics-workshop.jpg",
   "description": "A hands-on workshop exploring the latest advancements in AI and robotics.",
   "senior_incharge": "Dr. Alice Smith"
   }
2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/retrieveEvent
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/retrieveEvent/677d319d0a84f3c0499bd69c

 **Video**
1. Create:
   POST:https://zairzaappbackend.onrender.com/zairza/uploadVideo
   BODY:{
   "name": "Mastering Node.js",
   "description": "An advanced tutorial on building scalable applications with Node.js.",
   "url": "https://example.com/mastering-nodejs"
   }

2. Get All:
   GET:https://zairzaappbackend.onrender.com/zairza/getVideos
3. Get by ID:
   GET:https://zairzaappbackend.onrender.com/zairza/getVideo/677d340f0a84f3c0499bd6a3