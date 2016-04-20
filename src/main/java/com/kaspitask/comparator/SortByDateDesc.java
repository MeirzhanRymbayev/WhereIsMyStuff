package com.kaspitask.comparator;

import com.kaspitask.model.Question;

import java.util.Comparator;

public class SortByDateDesc implements Comparator<Question> {

    @Override
    public int compare(Question o1, Question o2) {
        long t1 = o1.getDateOfQuestion().getTime();
        long t2 = o2.getDateOfQuestion().getTime();
        if (t2 > t1)
            return 1;
        else if (t1 > t2)
            return -1;
        else
            return 0;
    }
}
