package com.spring.qna.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.spring.qna.mapper.PostAttachMapper;
import com.spring.qna.vo.PostAttachVO;

@Component
public class FileCheckTask {

	@Autowired 
	private PostAttachMapper postAttachMapper;

	private String getFolderYesterDay() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}

	@Scheduled(cron = "0 0 2 * * *")
	public void checkFiles() throws Exception {

		// file list in database
		List<PostAttachVO> fileList = postAttachMapper.getOldFiles();

		// ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("C:\\upload", vo.getA_savepath(), vo.getA_uuid() + "_" + vo.getA_filename())).collect(Collectors.toList());
		
		// image file has thumnail file
		fileList.stream().filter(vo -> vo.isA_isimage() == true).map(vo -> Paths.get("C:\\upload", vo.getA_savepath(), "s_" + vo.getA_uuid() + "_" + vo.getA_filename())).forEach(p -> fileListPaths.add(p));

		// files in yesterday directory
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();

		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);

		for (File file : removeFiles) {


			file.delete();

		}
	}
}
