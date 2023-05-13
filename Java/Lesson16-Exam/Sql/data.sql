
INSERT INTO department  (`name`			,created_date) 
VALUES
						('Marketing'	,'2019-10-01'),
						('Sale'			,'2020-11-02'),
						('Sercurity'	,'2015-11-09'),
						('Technical'	,NOW()		  ),
						('Accounting '	,'2019-10-01' );

                        
INSERT INTO project  (`name`			, manager_id		, created_date) 
VALUES
						('project1'	 	, 1				, '2019-10-01'),
						('project2'	 	, 5				, '2020-11-02'),
                        ('project3'	 	, 8				, '2014-11-09');
                        
						
                      
INSERT INTO  `user`  (username, 				`password`,		fullname, 			department_id,		phone,			email						, project_id		,created_date	)
VALUES			
						('duynn03',				'123456',	N'Nguyễn Ngọc Duy',			1,				'0123456789'	, 'duynn03@gmail.com'		, 1,	'2019-10-01'	),
						('dat.tranphu',			'123456',	N'Trần Phú Dao',			3,				'0125469872'	, 'alka.asura@gmail.com'	, 2,	'2020-11-02'	),
						('du.lengoc',			'123456',	N'Dinh Thị Đào',			5,				'0324651876'	, 'ntd19795@gmail.com'		, 2, 	'2018-07-09'	),
						('duc.nguyenthe',		'123456',	N'Nguyễn Thế Đức',			1,				'0245976413'	, 'tungnx@gmail.com'		, 3,	'2017-05-09'	),
						('hiep.vuhoang',		'123456',	N'Vũ Hoàng Hiệp',			3,				'0278421564'	, 'lamnt@gmail.com'			, 2, 	'2016-04-09'	),
						('nhung.nguyenthi',		'123456',	N'Nguyễn Thị Mỹ Nhung', 	2,				'0324651654'	, 'datpt@gmail.com.vn'		, 1,	'2015-11-09'	),
						('nhung.tongthi',		'123456',	N'Tống Thị Nhung',			1,				'0213179545'	, 'huongnv@gmail.com.vn'	, 1,	NOW()			),
						('thang.maichien',		'123456',	N'Mai Chiến Thắng',			3,				'0321415451'	, 'mynt2407@gmail.com.vn'	, 3,	NOW()			),
                       	('thao.dinhthu',		'123456',	N'Đinh Thu Thảo',			1,				'0321842454'	, 'hungnt@gmail.com.vn'		, 2,	'2020-11-11'	),
						('linh.nguyenthi',		'123456',	N'Nguyễn Thị Linh',			5,				'0321415175'	, 'Namlv@gmail.com.vn'		, 3,	NOW()			);
  
INSERT INTO employee  (user_id	, proskill) 
VALUES
						(1		, 'sql'),
                        (2		, 'java'),
                        (3		, 'htmt/css'),
                        (4		, 'js'),
                        (5		, 'c++');

                        
INSERT INTO manager  (user_id	, exp_in_year) 
VALUES
						(1		, 5),
                        (5		, default),
                        (8		, 2);
					