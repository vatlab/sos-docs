var images=["banner_keybaord.png","banner_screen.jpg"]
var guides= [
    {
        header: 2,
        title: "SoS Notebook"
    }, 
    {
        header: 3,
        title: "Using SoS Notebook "
    },
    
    {
        title: "Using multiple kernels in one Jupyter noetbook",
        name: "multi_kernel_notebook",
        fulltitle: " using multiple kernels in one jupyter noetbook multi_kernel_notebook "
    },
    {
        title: "Working with arbitrary subkernels",
        name: "expand_capture_render",
        fulltitle: " working with arbitrary subkernels magics cd expand capture and render expand_capture_render "
    },
    {
        title: "Exchanging data among kernels",
        name: "exchange_variable",
        fulltitle: " exchanging data among kernels magics get put use and with exchange_variable "
    },
    {
        title: "Using the console panel",
        name: "console_panel",
        fulltitle: " using the console panel console panel and shortcut ctrl-shift-enter console_panel "
    },
    {
        title: "Previewing variables and files",
        name: "magic_preview",
        fulltitle: " previewing variables and files magic preview magic_preview "
    },
    {
        title: "Tracking session and revision history of notebooks",
        name: "sessioninfo_revision",
        fulltitle: " tracking session and revision history of notebooks magic revisions and sessioninfo sessioninfo_revision "
    },
    {
        title: "Running cell in modified environments",
        name: "magic_env",
        fulltitle: " running cell in modified environments magic env magic_env "
    },
    {
        title: "Converting RMarkdown files to SoS notebooks",
        name: "rmd_to_ipynb",
        fulltitle: " converting rmarkdown files to sos notebooks sos convert rmd ipynb rmd_to_ipynb "
    },
    {
        title: "Exporting reports in HTML format",
        name: "magic_convert",
        fulltitle: " exporting reports in html format magic convert magic_convert "
    },
    {
        title: "More on magic <code>%use</code>",
        name: "magic_use",
        fulltitle: " more on magic code use code magic_use "
    },
    {
        title: "Workflow-execution magics",
        name: "workflow_magics",
        fulltitle: " workflow-execution magics magics run sosrun runfile workflow_magics "
    },
    {
        header: 3,
        title: "Supported languages "
    },
    
    {
        title: "Working with Bash and Zsh",
        name: "sos_bash",
        fulltitle: " working with bash and zsh module sos-bash sos_bash "
    },
    {
        title: "Working with JavaScript and TypeScript",
        name: "sos_javascript",
        fulltitle: " working with javascript and typescript module sos-javascript sos_javascript "
    },
    {
        title: "Working with Julia",
        name: "sos_julia",
        fulltitle: " working with julia module sos-julia sos_julia "
    },
    {
        title: "Working with Matlab and Octave",
        name: "sos_matlab",
        fulltitle: " working with matlab and octave module sos-matlab sos_matlab "
    },
    {
        title: "Working with Ruby",
        name: "sos_ruby",
        fulltitle: " working with ruby module sos-ruby sos_ruby "
    },
    {
        title: "Working with Python 2 and Python3",
        name: "sos_python",
        fulltitle: " working with python 2 and python3 module sos-python sos_python "
    },
    {
        title: "Working with R",
        name: "sos_r",
        fulltitle: " working with r module sos-r sos_r "
    },
    {
        title: "Working with SAS",
        name: "sos_sas",
        fulltitle: " working with sas module sos-sas sos_sas "
    },
    {
        title: "Working with Stata",
        name: "sos_stata",
        fulltitle: " working with stata module sos-stata sos_stata "
    },
    {
        title: "Uisng the markdown kernel",
        name: "markdown_kernel",
        fulltitle: " uisng the markdown kernel module markdown-kernel markdown_kernel "
    },
    {
        header: 3,
        title: "Technical details"
    },
    
    {
        title: "SoS Magics",
        name: "sos_magics",
        fulltitle: " sos magics sos_magics "
    },
    {
        title: "Writing a new language module",
        name: "language_module",
        fulltitle: " writing a new language module language_module "
    },
    {
        header: 2,
        title: "SoS Workflow"
    },
    
    {
        header: 3,
        title: "The basics"
    },
    {
        title: "SoS workflow: a 20 minute overview",
        name: "sos_overview",
        fulltitle: " sos workflow a 20 minute overview sos_overview "
    },
    {
        title: "Variables and parameters",
        name: "variable_and_parameter",
        fulltitle: " variables and parameters variable_and_parameter "
    },
    {
        title: "Step input, output, and substeps",
        name: "input_substeps",
        fulltitle: " step input output and substeps input_substeps "
    },
    {
        title: "Basic SoS workflows",
        name: "basic_workflow",
        fulltitle: " basic sos workflows basic_workflow "
    },
    {
        title: "Using SoS Workflow for daily data analysis",
        name: "organize_scripts",
        fulltitle: " using sos workflow for daily data analysis organize_scripts "
    },
    {
        header: 3,
        title: "Syntax and data types"
    },
    {
        title: "Syntax and file formats",
        name: "sos_syntax",
        fulltitle: " syntax and file formats sos_syntax "
    },
    {
        title: "Script format of function calls",
        name: "script_format",
        fulltitle: " script format of function calls script_format "
    },
    {
        title: "The parameter statement",
        name: "parameter_statement",
        fulltitle: " the parameter statement parameter_statement "
    },
    {
        title: "Configuration files",
        name: "config_files",
        fulltitle: " configuration files config_files "
    },
    {
        title: "SoS targets",
        name: "targets",
        fulltitle: " sos targets file_target sos_variable r_library and more targets "
    },
    {
        title: "The sos_targets data type",
        name: "sos_targets",
        fulltitle: " the sos_targets data type sos_targets "
    },
    {
        title: "SoS functions",
        name: "sos_functions",
        fulltitle: " sos functions get_output and expand_pattern sos_functions "
    },
    {
        title: "Extending SoS",
        name: "extending_sos",
        fulltitle: " extending sos extending_sos "
    },
    {
        header: 3,
        title: "SoS Steps"
    },
    {
        title: "The input statement",
        name: "input_statement",
        fulltitle: " the input statement input_statement "
    },
    {
        title: "Named input",
        name: "named_input",
        fulltitle: " named input named_input "
    },
    {
        title: "Input option group_by",
        name: "group_by",
        fulltitle: " input option group_by group_by "
    },
    {
        title: "Input option for_each",
        name: "for_each",
        fulltitle: " input option for_each for_each "
    },
    {
        title: "Input options paired_with and group_with",
        name: "paired_group_with",
        fulltitle: " input options paired_with and group_with paired_group_with "
    },
    {
        title: "Input option pattern and function expand_pattern",
        name: "input_pattern",
        fulltitle: " input option pattern and function expand_pattern input_pattern "
    },
    {
        title: "Input option concurrent",
        name: "concurrent_substep",
        fulltitle: " input option concurrent concurrent_substep "
    },
    {
        title: "Dynamic input",
        name: "dynamic_input",
        fulltitle: " dynamic input dynamic target dynamic_input "
    },
    {
        title: "The output statement",
        name: "output_statement",
        fulltitle: " the output statement output_statement "
    },
    {
        title: "Output option group_by",
        name: "output_group_by",
        fulltitle: " output option group_by output_group_by "
    },
    {
        title: "Output option paired_with and group_with",
        name: "output_groups_vars",
        fulltitle: " output option paired_with and group_with output_groups_vars "
    },
    {
        title: "Dynamic output",
        name: "dynamic_output",
        fulltitle: " dynamic output dynamic target dynamic_output "
    },
    {
        title: "The depends statement",
        name: "depends_statement",
        fulltitle: " the depends statement depends_statement "
    },
    {
        title: "SoS actions and common options",
        name: "sos_actions",
        fulltitle: " sos actions and common options sos_actions "
    },
    {
        title: "Command execution actions",
        name: "shell_actions",
        fulltitle: " command execution actions actions run sh and bash shell_actions "
    },
    {
        title: "Script execution actions",
        name: "script_actions",
        fulltitle: " script execution actions actions python r javascript etc script_actions "
    },
    {
        title: "Report generation actions",
        name: "report_actions",
        fulltitle: " report generation actions actions report pandoc and rmarkdown report_actions "
    },
    {
        title: "Conditional actions",
        name: "control_actions",
        fulltitle: " conditional actions actions warn_if skip_if done_if and fail_if control_actions "
    },
    {
        title: "Action download",
        name: "download_actions",
        fulltitle: " action download download_actions "
    },
    {
        title: "Running scripts in docker containers",
        name: "docker",
        fulltitle: " running scripts in docker containers action option container and action docker_build docker "
    },
    {
        title: "Running scripts in singularity",
        name: "singularity",
        fulltitle: " running scripts in singularity action options container and engine action singularity_build singularity "
    },
    {
        title: "The task statement and option -q)",
        name: "task_statement",
        fulltitle: " the task statement and option -q task_statement "
    },
    {
        title: "Host configuration",
        name: "host_setup",
        fulltitle: " host configuration sos hosts yml and sos remote command host_setup "
    },
    {
        title: "Task templates",
        name: "task_template",
        fulltitle: " task templates options such as mem cores walltime and nodes task_template "
    },
    {
        title: "Task tags",
        name: "task_tags",
        fulltitle: " task tags option tags task_tags "
    },
    {
        title: "Combining tasks",
        name: "trunk_size",
        fulltitle: " combining tasks options trunk_size and trunk_workers trunk_size "
    },
    {
        title: "Path translation and file synchronization",
        name: "task_files",
        fulltitle: " path translation and file synchronization options workdir to_host and from_host task_files "
    },
    {
        title: "Working with remote files",
        name: "remote_target",
        fulltitle: " working with remote files remote target remote_target "
    },
    {
        header: 3,
        title: "SoS Workflows"
    },
    {
        title: "Summary of step dependencies",
        name: "step_dependencies",
        fulltitle: " summary of step dependencies step_dependencies "
    },
    {
        title: "Named output",
        name: "named_output",
        fulltitle: " named output function named_output named_output "
    },
    {
        title: "Output from another step",
        name: "output_from",
        fulltitle: " output from another step function output_from output_from "
    },
    {
        title: "Explicit step and workflow dependency",
        name: "target_sos_step",
        fulltitle: " explicit step and workflow dependency target sos_step target_sos_step "
    },
    {
        title: "Makefile-style pattern-matching rules",
        name: "auxiliary_steps",
        fulltitle: " makefile-style pattern-matching rules section option provides auxiliary_steps "
    },
    {
        title: "Global and local variables",
        name: "step_variables",
        fulltitle: " global and local variables step_variables "
    },
    {
        title: "Sharing variables across steps",
        name: "shared_variables",
        fulltitle: " sharing variables across steps step and task option shared and target sos_variable shared_variables "
    },
    {
        title: "Introduction to SoS Workflows",
        name: "sos_workflows",
        fulltitle: " introduction to sos workflows sos_workflows "
    },
    {
        title: "Process-oriented workflows",
        name: "process_oriented",
        fulltitle: " process-oriented workflows process_oriented "
    },
    {
        title: "Outcome-oriented workflows",
        name: "outcome_oriented",
        fulltitle: " outcome-oriented workflows outcome_oriented "
    },
    {
        title: "Mixed-style workflows",
        name: "mixed_style",
        fulltitle: " mixed-style workflows mixed_style "
    },
    {
        title: "Data-flow style workflows",
        name: "data_flow",
        fulltitle: " data-flow style workflows data_flow "
    },
    {
        title: "Nested workflow",
        name: "nested_workflow",
        fulltitle: " nested workflow function sos_run nested_workflow "
    },
    {
        header: 3,
        title: "Command line interface"
    },
    {
        title: "List of all sos commands and options",
        name: "cli",
        fulltitle: " list of all sos commands and options cli "
    },
    {
        title: "Verbosity and number of workers",
        name: "verbosity_and_jobs",
        fulltitle: " verbosity and number of workers options -v and -j verbosity_and_jobs "
    },
    {
        title: "Runtime signature",
        name: "signature",
        fulltitle: " runtime signature option -s signature "
    },
    {
        title: "Error handling",
        name: "error_handling",
        fulltitle: " error handling option -e error_handling "
    },
    {
        title: "Dependency tracing",
        name: "trace_dependency",
        fulltitle: " dependency tracing option -t trace_dependency "
    },
    {
        title: "Dryrun mode",
        name: "dryrun",
        fulltitle: " dryrun mode option -n dryrun "
    },
    {
        title: "Customized environments and remote execution of workflows",
        name: "remote_execution",
        fulltitle: " customized environments and remote execution of workflows option -r remote_execution "
    },
    {
        title: "Output DAG of workflows",
        name: "workflow_dag",
        fulltitle: " output dag of workflows option -d workflow_dag "
    },
    {
        title: "Report generation",
        name: "workflow_summary",
        fulltitle: " report generation option -p workflow_summary "
    },
    {
        title: "Task management",
        name: "task_management",
        fulltitle: " task management commands status kill and purge task_management "
    },
    {
        title: "Setup and test remote hosts",
        name: "sos_remote",
        fulltitle: " setup and test remote hosts command sos remote sos_remote "
    },
    {
        title: "Format conversion",
        name: "convert",
        fulltitle: " format conversion command sos convert and convert convert "
    }
]
