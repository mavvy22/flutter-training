const kStorageKey = 'tasknaut.json';
const kStorageItemName = 'token';
const kBootstrapTransitionDuration = 3;

const kMyProfileGql = """
   query myProfile {
     myProfile {
       id
       username
       email
     }
   }
""";

const kLoginGql = """
  mutation login(\$input: LoginInput!) {
    login(input: \$input) {
      token
    }
  }
""";

const kRegistrationGql = """
  mutation registerUser(\$input: RegisterUserInput!) {
    registerUser(input: \$input) {
      token
    }
  }
""";

const kCreateProjectGql = """
  mutation createProject(\$input: CreateProjectInput!) {
    createProject(input: \$input) {
      id
      name
      tasks{
        id
        name
        description
        dueDate
        status
        assignee{
          username
          id
        }
      }
      createdBy{
        username
        id
      }
    }
  }
""";

const kMyProjectsGql = """
  query myProjects {
    myProjects {
      id
      name
      tasks{
        id
        name
        description
        dueDate
        status
        assignee{
          username
          id
        }
      }
      createdBy{
        username
        id
      }
    }
  }
""";
