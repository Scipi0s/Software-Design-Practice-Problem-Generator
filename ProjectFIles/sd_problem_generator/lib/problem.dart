
class Problem{
final String problemTitle;
final String problemDescription;
final String assignmentDefinition;

Problem({
    required this.problemTitle,
    required this.problemDescription,
    required this.assignmentDefinition,
  });

factory Problem.fromJson(Map<String, dynamic> json){
  return Problem(
  problemTitle: json["problem_title"]?.toString() ?? 'Untitled Problem',
  problemDescription: json["problem_description"]?.toString() ?? 'No description provided',
  assignmentDefinition: json["assignment_definition"]?.toString() ?? 'No assignment definition provided',
  );
}

Map<String, dynamic> toJson(){
  return{
    'problem_title': problemTitle,
    'problem_description': problemDescription,
    'assignment_definition': assignmentDefinition,
  };
}

}
