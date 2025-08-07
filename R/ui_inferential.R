# R/ui_inferential_stats.R

inferential_tab_ui <- accordion(
  id = "inferential_accordion",
  
  # Panel 1: Proportion Tests (Stays First)
  accordion_panel(
    title = "Proportion Tests",
    with_info_popover(
      ui_element = h4("One-Proportion Test"),
      title = "What is a One-Proportion Test?",
      content = "This test is used to compare the proportion of successes in a sample to a known or hypothesized proportion. Use it to answer questions like: 'Is the proportion of students who passed the exam (e.g., 65%) significantly different from our target of 70%?'"
    ),
    selectInput("prop_variable", "Select a categorical variable:", choices = NULL),
    textInput("success_value", "Success Value (e.g., Yes, True):", value = "Yes"),
    numericInput("prop_null", "Null Hypothesis Proportion (p\u2080):", value = 0.5, min = 0, max = 1, step = 0.01),
    selectInput("prop_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_prop_test", "Run One-Proportion Test"),
    verbatimTextOutput("prop_test_result"),
    hr(),
    with_info_popover(
      ui_element = h4("Two-Proportion Test"),
      title = "What is a Two-Proportion Test?",
      content = "This test compares the proportions of successes between two different groups. Use it to answer questions like: 'Is the passing rate for Group A significantly different from the passing rate for Group B?'"
    ),
    selectInput("prop_var", "Select Proportion Variable:", choices = NULL),
    selectInput("two_prop_group_var", "Select Grouping Variable:", choices = NULL),
    selectInput("two_prop_group1", "Value for Group 1:", choices = NULL),
    selectInput("two_prop_group2", "Value for Group 2:", choices = NULL),
    selectInput("two_prop_success", "Select Success Value:", choices = NULL),
    selectInput("two_prop_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_two_prop_test", "Run Two-Proportion Test"),
    verbatimTextOutput("two_prop_test_result")
  ),
  
  # Panel 2: Categorical Tests (Moved Up)
  accordion_panel(
    title = "Categorical Tests",
    with_info_popover(
      ui_element = h4("Chi-Squared Test / Contingency Table"),
      title = "What is a Chi-Squared Test?",
      content = "A Chi-Squared test is used to see if there is a significant relationship between two categorical variables (variables with distinct groups, like 'Gender' or 'Yes/No'). Use it to answer questions like: 'Is there a relationship between a person's gender and their preferred study method?'"
    ),
    uiOutput("select_chi_x"),
    uiOutput("select_chi_y"),
    checkboxInput("use_fisher_exact", "Use Fisher's Exact Test (for small samples)", value = FALSE),
    actionButton("run_chi_sq", "Run Chi-Squared Test"),
    verbatimTextOutput("chi_sq_output")
  ),
  
  # Panel 3: Normality Check (Moved Up)
  accordion_panel(
    title = "Normality Check",
    with_info_popover(
      ui_element = h4("Normality Check (for n < 30)"),
      title = "What is a Normality Check?",
      content = "Statistical tests like t-tests and ANOVA often assume that the data follows a normal distribution (a bell curve). This check helps you verify that assumption. If the p-value from the Shapiro-Wilk test is low (e.g., < 0.05), the data may not be normal, and you might need to use a different kind of statistical test."
    ),
    uiOutput("select_normality_var"),
    actionButton("check_normality", "Check Normality"),
    plotOutput("normality_plot"),
    verbatimTextOutput("shapiro_wilk_output")
  ),
  
  # Panel 4: Mean Tests (Moved to the Bottom)
  accordion_panel(
    title = "Mean Tests",
    with_info_popover(
      ui_element = h4("Hypothesis Testing (t-test)"),
      title = "What is a t-test?",
      content = "A t-test is used to compare the average (mean) of two groups to see if they are significantly different from each other. Use it when you want to know: 'Is the average score for Group A different from Group B?'"
    ),
    uiOutput("select_ht_variable"),
    uiOutput("select_ht_group_variable"),
    conditionalPanel(
      condition = "input.ht_group_variable == 'None'",
      numericInput("ht_mu", "Hypothesized Mean (\u03bc) for One-Sample Test", value = 0)
    ),
    selectInput("ht_alternative", "Alternative Hypothesis", choices = c("two.sided", "less", "greater")),
    checkboxInput("ht_var_equal", "Assume Equal Variances (for Two-Sample Test)", value = TRUE),
    actionButton("run_ht", "Run t-test"),
    verbatimTextOutput("ht_output"),
    hr(),
    with_info_popover(
      ui_element = h4("Paired t-test"),
      title = "What is a Paired t-test?",
      content = "This is a special type of t-test used when each subject is measured twice, creating 'paired' observations (e.g., a before-and-after score). Use it to answer questions like: 'Did students' scores significantly improve after attending a workshop?'"
    ),
    selectInput("paired_var1", "Select First Variable:", choices = NULL),
    selectInput("paired_var2", "Select Second Variable:", choices = NULL),
    selectInput("paired_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_paired_ttest", "Run Paired t-test"),
    verbatimTextOutput("paired_ttest_result"),
    hr(),
    with_info_popover(
      ui_element = h4("ANOVA (Analysis of Variance)"),
      title = "What is an ANOVA?",
      content = "ANOVA is used to compare the averages (means) of three or more groups at once. Use it when you want to know: 'Are there any significant differences in the average scores between Group A, Group B, and Group C?'"
    ),
    uiOutput("select_anova_dv"),
    uiOutput("select_anova_iv"),
    actionButton("run_anova", "Run ANOVA"),
    verbatimTextOutput("anova_output")
  )
)