const kAppName = 'Tasknaut';
const kGraphqlLink = 'http://localhost:4000/graphql';
const kStorageKey = 'tasknaut.json';
const kStorageItemName = 'token';
const kBootstrapTransitionDuration = 3;

const kTaskFields = """
        id
        name
        description
        dueDate
        status
        assignee{
          username
          id
        }
""";

const kProjectFields = """
      id
      name
      description
      tasks{
        $kTaskFields
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
      $kProjectFields
    }
  }
""";

const kMyProjectsGql = """
  query myProjects {
    myProjects {
      $kProjectFields
    }
  }
""";

const kProjectByIdGql = """
  query projectById(\$input: IdInput!) {
    projectById(input: \$input) {
      $kProjectFields
    }
  }
""";

const kUpdateProjectGql = """
  mutation updateProject(\$input: UpdateProjectInput!) {
    updateProject(input: \$input) {
      $kProjectFields
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

const kAddTask = """
  mutation addTask(\$input: AddTaskInput!) {
    addTask(input: \$input) {
      $kTaskFields
    }
  }
""";

const kMyTasks = """
  query myTasks {
    myTasks {
      $kTaskFields
    }
  }
""";
