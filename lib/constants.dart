const kStorageKey = 'tasknaut.json';
const kStorageItemName = 'token';

const kMyProfileGql = """
   query myProfile {
     myProfile {
       id
       username
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
