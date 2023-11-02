const kAppName = 'Tasknaut';
const kGraphqlLink = 'http://localhost:4000/graphql';
const kStorageKey = 'tasknaut.json';
const kStorageItemName = 'token';
const kBootstrapTransitionDuration = 3;

const project = """
      id
      name
      description
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
""";

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
      $project
    }
  }
""";

const kMyProjectsGql = """
  query myProjects {
    myProjects {
      $project
    }
  }
""";

const kProjectByIdGql = """
  query projectById(\$input: IdInput!) {
    projectById(input: \$input) {
      $project
    }
  }
""";

const kUpdateProjectGql = """
  mutation updateProject(\$input: UpdateProjectInput!) {
    updateProject(input: \$input) {
      $project
    }
  }
""";

const kDeleteProject = """
  mutation deleteProject(\$input: IdInput!) {
    deleteProject(input: \$input) {
      status
    }
  }
""";
