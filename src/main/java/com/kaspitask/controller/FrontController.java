package com.kaspitask.controller;

import com.kaspitask.comparator.SortByDateDesc;
import com.kaspitask.model.Answer;
import com.kaspitask.model.Category;
import com.kaspitask.model.Question;
import com.kaspitask.service.CategoryService;
import com.kaspitask.service.QuestionService;
import com.kaspitask.service.UserService;
import com.kaspitask.springsecurity.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("/")
public class FrontController {

    private QuestionService questionService;
    private UserService userService;
    private CategoryService categoryService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String mainMenu(ModelMap model) {
        List<Question> questions = questionService.findAllWithDetails();
        Collections.sort(questions, new SortByDateDesc());
        model.addAttribute("questions", questions);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "index";
    }

    @RequestMapping(value = "/question", method = RequestMethod.GET)
    public String questionPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "question";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
        model.addAttribute("user", getPrincipal());
        return "accessDenied";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/question", method = RequestMethod.POST)
    public String createQuestion(@RequestParam("title") String title,
                                 @RequestParam("description") String description,
                                 @RequestParam("category") String category,
                                 @RequestParam("userName") String userName) {

        Question question = new Question();
        question.setTitle(title);
        question.setDescription(description);
        setCategories(question, category);
        question.setUser(userService.findByUserName(userName));
        question.setDateOfQuestion(new Date());
        questionService.save(question);
        return "redirect:/home";
    }

    @RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
    public String questionView(@PathVariable Long id, ModelMap model) {
        model.addAttribute("user", getPrincipal());
        Question question = questionService.findById(id);
        model.addAttribute("question", question);
        return "questionView";
    }

    @RequestMapping(value = "/answer", method = RequestMethod.POST)
    public String createQuestion(@RequestParam("questionId") Long questionId,
                                 @RequestParam("answerText") String answerText,
                                 @RequestParam("userName") String userName, ModelMap model) {

        Question question = questionService.findById(questionId);
        Answer answer = new Answer();
        answer.setUser(userService.findByUserName(userName));
        answer.setText(answerText);
        answer.setQuestion(question);
        answer.setDateOfAnswer(new Date());
        question.getAnswers().add(answer);
        questionService.save(question);
        return "redirect:/home";
    }

    @RequestMapping(value = "/users/{userName}", method = RequestMethod.GET)
    public String userPage(@PathVariable String userName, ModelMap model) {
        model.addAttribute("username", getPrincipal());
        User user = userService.findByUserName(userName);
        model.addAttribute("user", user);
        return "userPage";
    }

    @RequestMapping(value = "/users/{userName}/edit", method = RequestMethod.POST)
    public String userEdit(@PathVariable String userName, ModelMap model,
                           @RequestParam("username") String username,
                           @RequestParam("email") String email) {
        User user = userService.findByUserName(userName);
        user.setUserName(username);
        user.setEmail(email);
        User savedUser = userService.save(user);
        model.addAttribute("user", savedUser);
        return "userPage";
    }

    @RequestMapping(value = "/users/{userName}/edit", method = RequestMethod.GET)
    public String userEdit(@PathVariable String userName, ModelMap model) {
        User user = userService.findByUserName(userName);
        model.addAttribute("user", user);
        return "userEdit";
    }

    @RequestMapping(value = "/sort/{categoryName}", method = RequestMethod.GET)
    public String sortByCategoryName(@PathVariable String categoryName, ModelMap model) {
        List<Question> questions = questionService.findAll();
        List<Question> filteredQuestions = filterByCategoryName(questions, categoryName);
        Collections.sort(filteredQuestions, new SortByDateDesc());
        model.addAttribute("questions", filteredQuestions);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "index";
    }

    private List<Question> filterByCategoryName(List<Question> questions, String categoryName) {
        ArrayList<Question> filteredQuestions = new ArrayList<>();
        for (Question question : questions
                ) {
            for (Category category :
                    question.getCategories()) {
                if (category.getName().equals(categoryName)) {
                    filteredQuestions.add(question);
                }

            }
        }
        return filteredQuestions;
    }

    private void setCategories(Question question, String category) {
        String[] categories = category.split(",");
        HashSet<Category> categorySet = new HashSet<>();
        if (categories.length > 1) {
            for (String name :
                    categories) {
                Category cat = new Category(name);
                categorySet.add(cat);
            }
            question.setCategories(categorySet);
        } else {
            categorySet.add(new Category(category));
            question.setCategories(categorySet);
        }
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    @Autowired
    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
