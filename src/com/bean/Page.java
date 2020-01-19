package com.bean;

import java.util.List;

public class Page {
    // 当前页面数
    private int currentPage;
    // 页面大小 pageSize
    private int pageSize;

    // 总数 totalCount
    private int totalCount;

    // 总页面数 totalPage
    private int totalPage;

    private List<Sixin> sixin;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
