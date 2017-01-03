@Products = new Meteor.Collection('Products')

Schemas.Products = new SimpleSchema
	name:
		type:String
    label:'产品名字'
		max: 20

	content:
		type: String
    label:"详情页"
		autoform:
			afFieldInput:
				type: 'summernote'

	createdAt:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	picture:
		type: String
    label:"封面图"
		autoform:
			afFieldInput:
				type: 'fileUpload'
				collection: 'Attachments'

	category:
		type: String
    label:"分类"
		autoform:
			type:'select-radio-inline'
			options: ->
				[
					{label:'3D打印机',value:'3dprinters'}
					{label:'3D扫描仪',value:'3dscanners'}
					{label:'周边及耗材',value:'accessories'}
				]

Products.attachSchema(Schemas.Products)
