complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
#set AWS_DEFAULT_PROFILE RB
#export AWS_DEFAULT_PROFILE
#set AWS_DEFAULT_REGION us-west-2
#export AWS_DEFAULT_PROFILE
