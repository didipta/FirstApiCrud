import 'package:crudass/Apicall/Apicall.dart';
import 'package:crudass/Model/Product.dart';
import 'package:crudass/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductFrom extends StatefulWidget {
  final Products? products;
  const ProductFrom({Key? key, this.products}) : super(key: key);

  @override
  State<ProductFrom> createState() => _ProductFromState();
}

class _ProductFromState extends State<ProductFrom> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addNewProductInProgress = false;
  @override
  void initState() {
    super.initState();
    if(widget.products!=null){
      _nameTEController.text = widget.products?.productName?? '';
      _unitPriceTEController.text = widget.products?.unitPrice.toString() ?? '';
      _quantityTEController.text = widget.products?.qty.toString() ?? '';
      _totalPriceTEController.text = widget.products?.totalPrice.toString()?? '';
      _imageTEController.text = widget.products?.img ?? '';
      _productCodeTEController.text = widget.products?.productCode ?? '';
    }
  }


  void _addproduct (context) async{
    await addProduct(_imageTEController, _productCodeTEController, _nameTEController,_quantityTEController, _totalPriceTEController, _unitPriceTEController,context, (loader) =>{
      setState(() {
        _addNewProductInProgress=loader;
    })}
    );

  }
  void _updateproduct (context) async{
    await UpdateProduct(widget.products?.id,_imageTEController, _productCodeTEController, _nameTEController,_quantityTEController, _totalPriceTEController, _unitPriceTEController,context, (loader) =>{
      setState(() {
        _addNewProductInProgress=loader;
    })}
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.products==null?"Create Product":"Update Product",style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),),
        leading:IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
            decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _nameTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: 'Name', labelText: 'Name'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _unitPriceTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Unit Price', labelText: 'Unit Price'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your unit price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _productCodeTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,

                    decoration: const InputDecoration(
                        hintText: 'Product Code', labelText: 'Product Code'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your product code';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _quantityTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Quantity', labelText: 'Quantity'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your quantity';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _totalPriceTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Total Price', labelText: 'Total Price'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your total price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration:boxDecoration(),
                  child: TextFormField(
                    controller: _imageTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: 'Image', labelText: 'Image'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Write your image';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                Visibility(
                  visible: _addNewProductInProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      style: buttonStyle(Colors.black87),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                         widget.products==null? _addproduct(context):
                          _updateproduct(context);
                        }
                      },
                      child: Text(widget.products==null?'Add':'Update',style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );


  }
  @override
  void dispose() {
    _nameTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
