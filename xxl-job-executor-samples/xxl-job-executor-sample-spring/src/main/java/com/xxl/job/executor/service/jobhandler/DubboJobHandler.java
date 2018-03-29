package com.xxl.job.executor.service.jobhandler;


import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHandler;
import com.xxl.job.core.log.XxlJobLogger;
import fl.demo.facade.api.IDemoApiService;
import fl.demo.facade.dto.DemoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 测试Dubbo
 */
@JobHandler(value="dubboJobHandler")
@Component
public class DubboJobHandler extends IJobHandler {
    @Autowired
    private IDemoApiService demoApiService;
    @Override
    public ReturnT<String> execute(String param) throws Exception {
        DemoDTO dto = this.demoApiService.selectDemoDTOById(555L);
        XxlJobLogger.log("测试DUBBO服务DEMO示例id为555的名称是:"+dto.getName());
        return SUCCESS;
    }
}