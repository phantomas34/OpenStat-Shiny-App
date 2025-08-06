# R/ui_inferential_stats.R

# This object contains the entire UI for the Inferential Statistics tab.
# It can now be edited by one developer without creating conflicts in the main ui.R.
inferential_tab_ui <- accordion(
  id = "inferential_accordion",
  
  accordion_panel(
    title = "Proportion Tests",
    h4("One-Proportion Test"),
    selectInput("prop_variable", "Select a categorical variable:", choices = NULL),
    textInput("success_value", "Success Value (e.g., Yes, True):", value = "Yes"),
    numericInput("prop_null", "Null Hypothesis Proportion (p\u2080):", value = 0.5, min = 0, max = 1, step = 0.01),
    selectInput("prop_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_prop_test", "Run One-Proportion Test"),
    verbatimTextOutput("prop_test_result"),
    hr(),
    h4("Two-Proportion Test"),
    selectInput("prop_var", "Select Proportion Variable:", choices = NULL),
    selectInput("two_prop_group_var", "Select Grouping Variable:", choices = NULL),
    selectInput("two_prop_group1", "Value for Group 1:", choices = NULL),
    selectInput("two_prop_group2", "Value for Group 2:", choices = NULL),
    selectInput("two_prop_success", "Select Success Value:", choices = NULL),
    selectInput("two_prop_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_two_prop_test", "Run Two-Proportion Test"),
    verbatimTextOutput("two_prop_test_result")
  ),
  
  accordion_panel(
    title = "Mean Tests",
    h4("ANOVA (Analysis of Variance)"),
    uiOutput("select_anova_dv"),
    uiOutput("select_anova_iv"),
    actionButton("run_anova", "Run ANOVA"),
    verbatimTextOutput("anova_output"),
    hr(),
    h4("Hypothesis Testing (t-test)"),
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
    h4("Paired t-test"),
    selectInput("paired_var1", "Select First Variable:", choices = NULL),
    selectInput("paired_var2", "Select Second Variable:", choices = NULL),
    selectInput("paired_alternative", "Alternative Hypothesis:", choices = c("Two-sided" = "two.sided", "Less than" = "less", "Greater than" = "greater")),
    actionButton("run_paired_ttest", "Run Paired t-test"),
    verbatimTextOutput("paired_ttest_result")
  ),
  
  accordion_panel(
    title = "Categorical Tests",
    h4("Chi-Squared Test / Contingency Table"),
    uiOutput("select_chi_x"),
    uiOutput("select_chi_y"),
    checkboxInput("use_fisher_exact", "Use Fisher's Exact Test (for small samples)", value = FALSE),
    actionButton("run_chi_sq", "Run Chi-Squared Test"),
    verbatimTextOutput("chi_sq_output")
  ),
  
  accordion_panel(
    title = "Normality Check",
    h4("Normality Check (for n < 30)"),
    uiOutput("select_normality_var"),
    actionButton("check_normality", "Check Normality"),
    plotOutput("normality_plot"),
    verbatimTextOutput("shapiro_wilk_output")
  )
)

